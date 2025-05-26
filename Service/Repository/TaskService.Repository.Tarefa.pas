unit TaskService.Repository.Tarefa;

interface

uses
  System.JSON, TaskService.Model.Tarefa;

  //Rotas padrão
  function GetAllTarefasAsJSONArraySQL: TJSONArray;
  procedure InsertTarefaSQL(const ATarefa: TTarefa);
  procedure UpdateTarefaStatusSQL(const AId: Integer; const AStatus: string);
  procedure DeleteTarefaSQL(const AId: Integer);
  //Desafio SQL
  function GetTotalTarefasSQL: Integer;
  function GetMediaPrioridadePendentesSQL: Double;
  function GetTarefasConcluidasUltimos7DiasSQL: Integer;


implementation

uses
  ZDataset,
  TaskService.Utils.Tarefa,
  TaskService.Factory.Conexao,
  System.SysUtils;

function GetAllTarefasAsJSONArraySQL: TJSONArray;
var
  LQuery: TZQuery;
begin
  LQuery := TZQuery.Create(nil);
  try
    LQuery.Connection := TConnectionFactory.CreateConnection;
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

procedure InsertTarefaSQL(const ATarefa: TTarefa);
var
  LQuery: TZQuery;
begin
  LQuery := TZQuery.Create(nil);
  try
    LQuery.Connection := TConnectionFactory.CreateConnection;
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

procedure UpdateTarefaStatusSQL(const AId: Integer; const AStatus: string);
var
  LQuery: TZQuery;
begin
  LQuery := TZQuery.Create(nil);
  try
    LQuery.Connection := TConnectionFactory.CreateConnection;
    LQuery.SQL.Text := 'UPDATE Tarefas SET Status = :Status WHERE Id = :Id';

    LQuery.ParamByName('Status').AsString := AStatus;
    LQuery.ParamByName('Id').AsInteger := AId;

    LQuery.ExecSQL;
  finally
    LQuery.Free;
  end;
end;

procedure DeleteTarefaSQL(const AId: Integer);
var
  LQuery: TZQuery;
begin
  LQuery := TZQuery.Create(nil);
  try
    LQuery.Connection := TConnectionFactory.CreateConnection;
    LQuery.SQL.Text := 'DELETE FROM Tarefas WHERE Id = :Id';

    LQuery.ParamByName('Id').AsInteger := AId;

    LQuery.ExecSQL;
  finally
    LQuery.Free;
  end;
end;

{Desafio SQL - Rotas calculadas}

function GetTotalTarefasSQL: Integer;
var
  LQuery: TZQuery;
begin
  LQuery := TZQuery.Create(nil);
  try
    LQuery.Connection := TConnectionFactory.CreateConnection;
    LQuery.SQL.Text := 'SELECT COUNT(*) AS Total FROM Tarefas';
    LQuery.Open;
    Result := LQuery.FieldByName('Total').AsInteger;
  finally
    LQuery.Free;
  end;
end;

function GetMediaPrioridadePendentesSQL: Double;
var
  LQuery: TZQuery;
begin
  LQuery := TZQuery.Create(nil);
  try
    LQuery.Connection := TConnectionFactory.CreateConnection;
    LQuery.SQL.Text := 'SELECT AVG(CAST(Prioridade AS FLOAT)) AS MediaPrioridade FROM Tarefas WHERE Status = ''Pendente''';
    LQuery.Open;
    Result := LQuery.FieldByName('MediaPrioridade').AsFloat;
  finally
    LQuery.Free;
  end;
end;

function GetTarefasConcluidasUltimos7DiasSQL: Integer;
var
  LQuery: TZQuery;
begin
  LQuery := TZQuery.Create(nil);
  try
    LQuery.Connection := TConnectionFactory.CreateConnection;
    LQuery.SQL.Text :=
      'SELECT COUNT(*) AS TotalConcluidas ' +
      'FROM Tarefas ' +
      'WHERE Status = ''Concluída'' ' +
      'AND DataConclusao >= DATEADD(DAY, -7, GETDATE())';
    LQuery.Open;
    Result := LQuery.FieldByName('TotalConcluidas').AsInteger;
  finally
    LQuery.Free;
  end;
end;


end.

