unit TasksService.Controller.Tarefa;

interface

uses
  Horse, System.SysUtils, System.JSON, Data.DB, FireDAC.Comp.Client;

procedure RegisterTarefaRoutes;

implementation

uses
  uConexao;

procedure GetAllTarefas(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  FDQuery: TFDQuery;
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := GetConnection;
    FDQuery.SQL.Text := 'SELECT * FROM Tarefas';
    FDQuery.Open;

    JSONArray := TJSONArray.Create;
    while not FDQuery.Eof do
    begin
      JSONObject := TJSONObject.Create;
      JSONObject.AddPair('Id', TJSONNumber.Create(FDQuery.FieldByName('Id').AsInteger));
      JSONObject.AddPair('Descricao', FDQuery.FieldByName('Descricao').AsString);
      JSONObject.AddPair('Status', FDQuery.FieldByName('Status').AsString);
      JSONObject.AddPair('Prioridade', TJSONNumber.Create(FDQuery.FieldByName('Prioridade').AsInteger));
      JSONObject.AddPair('DataCriacao', FDQuery.FieldByName('DataCriacao').AsString);
      JSONObject.AddPair('DataConclusao', FDQuery.FieldByName('DataConclusao').AsString);
      JSONArray.AddElement(JSONObject);
      FDQuery.Next;
    end;

    Res.Send<TJSONArray>(JSONArray);
  finally
    FDQuery.Free;
  end;
end;

procedure RegisterTarefaRoutes;
begin
  THorse.Get('/tarefas', GetAllTarefas);
  // Aqui você pode adicionar:
  // THorse.Post('/tarefas', AddTarefa);
  // THorse.Put('/tarefas/:id/status', UpdateTarefa);
  // THorse.Delete('/tarefas/:id', DeleteTarefa);
end;

end.

