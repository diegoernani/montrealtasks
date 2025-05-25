unit TaskService.Controller.Tarefa;

interface

uses
  Horse, System.SysUtils, System.JSON, Data.DB, FireDAC.Comp.Client;

procedure RegisterTarefaRoutes;

implementation

uses
  ZConnection,
  ZDataset,
  TaskService.Repository.Conexao,
  TaskService.Repository.Tarefa,
  TaskService.Model.Tarefa,
  System.DateUtils;

procedure GetAllTarefas(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  JSONArray: TJSONArray;
begin
  try
    JSONArray := GetAllTarefasAsJSONArray;
    Res.ContentType('application/json').Status(200).Send(JSONArray.ToJSON());   //Coloquei o contenttype pois meu postman não estava lendo corretamente o json de retorno ContentType('application/json')
  except
    on E: Exception do
      Res.Status(500).Send('Erro ao consultar tarefas: ' + E.Message);
  end;
end;

procedure InsertTarefa(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  AJSON: TJSONObject;
  ATarefa: TTarefa;
begin
  AJSON := Req.Body<TJSONObject>;
  ATarefa := TTarefa.FromJSON(AJSON);
  try
    ATarefa.Validar;
    InsertTarefaRepository(ATarefa);
    Res.Status(201).Send('Tarefa criada com sucesso!');
  except
    on E: Exception do
      Res.Status(500).Send('Erro ao criar tarefa: ' + E.Message);
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
    Exit;
  end;

  AJSON := Req.Body<TJSONObject>;
  if not AJSON.TryGetValue<string>('Status', AStatus) then
  begin
    Res.Status(400).Send('Status não informado');
    Exit;
  end;

  try
    UpdateTarefaStatus(AId, AStatus);
    Res.Status(200).Send('Tarefa atualizada com sucesso!');
  except
    on E: Exception do
      Res.Status(500).Send('Erro ao atualizar tarefa: ' + E.Message);
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
    Exit;
  end;

  try
    DeleteTarefaRepository(AId);
    Res.Status(200).Send('Tarefa excluída com sucesso!');
  except
    on E: Exception do
      Res.Status(500).Send('Erro ao excluir tarefa: ' + E.Message);
  end;
end;

procedure RegisterTarefaRoutes;
begin
  THorse.Get('/tarefas', GetAllTarefas);
  THorse.Post('/tarefas', InsertTarefa);
  THorse.Put('/tarefas/:id/status', UpdateTarefa);
  THorse.Delete('/tarefas/:id', DeleteTarefa);
end;

end.

