unit TaskService.Repository.Tarefa;

interface

uses
  System.JSON;

function GetAllTarefasAsJSONArray: TJSONArray;

implementation

uses
  ZDataset,
  TaskService.Repository.Conexao,
  TaskService.Utils.Tarefa,
  System.SysUtils;

function GetAllTarefasAsJSONArray: TJSONArray;
var
  LQuery: TZQuery;
begin
  LQuery := TZQuery.Create(nil);
  try
    LQuery.Connection := GetConnection;
    LQuery.SQL.Text := 'SELECT * FROM Tarefas';
    try
      LQuery.Open;
    except
      on E: Exception do
        raise Exception.Create('Erro ao consultar tarefas: ' + E.Message);
    end;

    Result := ConvertQueryToJSONArray(LQuery);
  finally
    LQuery.Free;
  end;
end;

end.

