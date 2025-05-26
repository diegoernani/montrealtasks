unit TaskService.Controller.Tarefa;

interface

uses
  Horse, System.SysUtils, System.JSON, Data.DB, FireDAC.Comp.Client;

  procedure RegisterTarefaRoutes;

implementation

uses
  ZConnection,
  ZDataset,
  TaskService.Repository.Tarefa,
  TaskService.Model.Tarefa,
  System.DateUtils,
  System.Math;

procedure GetAllTarefas(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  JSONArray: TJSONArray;
begin
  try
    JSONArray := GetAllTarefasAsJSONArraySQL;
    Res.ContentType('application/json').Status(200).Send(JSONArray.ToJSON());   //Coloquei o contenttype pois meu postman não estava lendo corretamente o json de retorno ContentType('application/json')
  except
    on E: Exception do
    begin
      Res.Status(500).Send('Erro ao consultar tarefas: ' + E.Message);
      raise EHorseCallbackInterrupted.Create();
    end;
  end;
end;

procedure InsertTarefa(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  AJSON: TJSONObject;
  ATarefa: TTarefa;
begin
  AJSON := TJSONObject.ParseJSONValue(Req.Body) as TJSONObject;
  ATarefa := TTarefa.FromJSON(AJSON);
  try
    ATarefa.Validar;
    InsertTarefaSQL(ATarefa);
    Res.Status(201).Send('Tarefa criada com sucesso.');
  except
    on E: Exception do
    begin
      Res.Status(400).Send('Erro ao criar tarefa: ' + E.Message);
      raise EHorseCallbackInterrupted.Create();
    end;
  end;
end;

procedure UpdateTarefa(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  AId: Integer;
  AJSON: TJSONObject;
  AStatus: string;
begin
  AId := StrToIntDef(Req.Params['id'], 0);
  if AId = 0 then
  begin
    Res.Status(400).Send('ID inválido');
    raise EHorseCallbackInterrupted.Create();
  end;

  AJSON := TJSONObject.ParseJSONValue(Req.Body) as TJSONObject;
  if not AJSON.TryGetValue<string>('Status', AStatus) then
  begin
    Res.Status(400).Send('Status não informado');
    raise EHorseCallbackInterrupted.Create();
  end;

  try
    UpdateTarefaStatusSQL(AId, AStatus);
    Res.Status(200).Send('Tarefa atualizada com sucesso.');
  except
    on E: Exception do
    begin
      Res.Status(500).Send('Erro ao atualizar tarefa: ' + E.Message);
      raise EHorseCallbackInterrupted.Create();
    end;
  end;
end;

procedure DeleteTarefa(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  AId: Integer;
begin
  AId := StrToIntDef(Req.Params['id'], 0);
  if AId = 0 then
  begin
    Res.Status(400).Send('ID inválido');
    raise EHorseCallbackInterrupted.Create();
  end;

  try
    DeleteTarefaSQL(AId);
    Res.Status(200).Send('Tarefa excluída com sucesso.');
  except
    on E: Exception do
    begin
      Res.Status(500).Send('Erro ao excluir tarefa: ' + E.Message);
      raise EHorseCallbackInterrupted.Create();
    end;
  end;
end;

procedure GetTotalTarefas(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Total: Integer;
  JSON: TJSONObject;
begin
  try
    Total := GetTotalTarefasSQL;
    JSON := TJSONObject.Create;
    JSON.AddPair('resultado', TJSONNumber.Create(Total));
    Res.ContentType('application/json').Status(200).Send(JSON.ToJSON);
  except
    on E: Exception do
    begin
      Res.Status(500).Send('Erro ao consultar total de tarefas: ' + E.Message);
      raise EHorseCallbackInterrupted.Create();
    end;
  end;
end;

procedure GetMediaPrioridadePendentes(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Media: Double;
  JSON: TJSONObject;
begin
  try
    Media := GetMediaPrioridadePendentesSQL;
    JSON := TJSONObject.Create;
    JSON.AddPair('resultado', FloatToStr(SimpleRoundTo(TJSONNumber.Create(Media).AsDouble, -1)));
    Res.ContentType('application/json').Status(200).Send(JSON.ToJSON);
  except
    on E: Exception do
    begin
      Res.Status(500).Send('Erro ao consultar média de prioridade: ' + E.Message);
      raise EHorseCallbackInterrupted.Create();
    end;
  end;
end;

procedure GetTarefasConcluidasUltimos7Dias(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Total: Integer;
  JSON: TJSONObject;
begin
  try
    Total := GetTarefasConcluidasUltimos7DiasSQL;
    JSON := TJSONObject.Create;
    JSON.AddPair('resultado', TJSONNumber.Create(Total));
    Res.ContentType('application/json').Status(200).Send(JSON.ToJSON);
  except
    on E: Exception do
    begin
      Res.Status(500).Send('Erro ao consultar tarefas concluídas: ' + E.Message);
      raise EHorseCallbackInterrupted.Create();
    end;
  end;
end;


procedure RegisterTarefaRoutes;
begin
  //As rotas chamam metodos dessa classe Controller
  // que passa pelo Model para aplicar validações e em seguida
  // comunica com Repository para acesso a tabela Tarefas.
  //Todos metodos tem os tratamentos de erro que retornação na aplicação client
  //Usei o raise EHorseCallbackInterrupted.Create(); pois o horse não estava enviando meu status e mensagem, depende de um middleware instalado

  {Rotas padrão}
  THorse.Get('/tarefas', GetAllTarefas);
  THorse.Post('/tarefas', InsertTarefa);
  THorse.Put('/tarefas/:id/status', UpdateTarefa);
  THorse.Delete('/tarefas/:id', DeleteTarefa);

  {Desafio SQL}
  THorse.Get('/tarefas/total', GetTotalTarefas);
  THorse.Get('/tarefas/media-prioridade-pendentes', GetMediaPrioridadePendentes);
  THorse.Get('/tarefas/concluidas-7-dias', GetTarefasConcluidasUltimos7Dias);
end;

end.

