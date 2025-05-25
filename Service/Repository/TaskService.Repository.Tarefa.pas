unit TaskService.Repository.Tarefa;

interface

uses
  System.JSON, TaskService.Model.Tarefa;

function GetAllTarefasAsJSONArray: TJSONArray;
procedure InsertTarefaRepository(const ATarefa: TTarefa);
procedure UpdateTarefaStatus(const AId: Integer; const AStatus: string);
procedure DeleteTarefaRepository(const AId: Integer);

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

procedure InsertTarefaRepository(const ATarefa: TTarefa);
var
  LQuery: TZQuery;
begin
  LQuery := TZQuery.Create(nil);
  try
    LQuery.Connection := GetConnection;
    LQuery.SQL.Text := 'INSERT INTO Tarefas (Descricao, Status, Prioridade, DataCriacao, DataConclusao) ' +
                       'VALUES (:Descricao, :Status, :Prioridade, :DataCriacao, :DataConclusao)';

    LQuery.ParamByName('Descricao').AsString := ATarefa.Descricao;
    LQuery.ParamByName('Status').AsString := ATarefa.Status;
    LQuery.ParamByName('Prioridade').AsInteger := ATarefa.Prioridade;
    LQuery.ParamByName('DataCriacao').AsDateTime := ATarefa.DataCriacao;
    LQuery.ParamByName('DataConclusao').AsDateTime := ATarefa.DataConclusao;

    LQuery.ExecSQL;
  finally
    LQuery.Free;
  end;
end;

procedure UpdateTarefaStatus(const AId: Integer; const AStatus: string);
var
  LQuery: TZQuery;
begin
  LQuery := TZQuery.Create(nil);
  try
    LQuery.Connection := GetConnection;
    LQuery.SQL.Text := 'UPDATE Tarefas SET Status = :Status WHERE Id = :Id';

    LQuery.ParamByName('Status').AsString := AStatus;
    LQuery.ParamByName('Id').AsInteger := AId;

    LQuery.ExecSQL;
  finally
    LQuery.Free;
  end;
end;

procedure DeleteTarefaRepository(const AId: Integer);
var
  LQuery: TZQuery;
begin
  LQuery := TZQuery.Create(nil);
  try
    LQuery.Connection := GetConnection;
    LQuery.SQL.Text := 'DELETE FROM Tarefas WHERE Id = :Id';

    LQuery.ParamByName('Id').AsInteger := AId;

    LQuery.ExecSQL;
  finally
    LQuery.Free;
  end;
end;


end.

