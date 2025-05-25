unit TasksService.Controller.Tarefa;

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

procedure RegisterTarefaRoutes;
begin
  THorse.Get('/tarefas', GetAllTarefas);
  THorse.Post('/tarefas', InsertTarefa);
  THorse.Put('/tarefas/:id/status', UpdateTarefa);
  THorse.Delete('/tarefas/:id', DeleteTarefa);
end;

end.

