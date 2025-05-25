unit TasksService.Model.Tarefa;

interface

uses
  System.JSON, System.SysUtils, System.DateUtils;

type
  TTarefa = class
  private
    FId: Integer;
    FDescricao: string;
    FStatus: string;
    FPrioridade: Integer;
    FDataCriacao: TDateTime;
    FDataConclusao: TDateTime;
  public
    property Id: Integer read FId write FId;
    property Descricao: string read FDescricao write FDescricao;
    property Status: string read FStatus write FStatus;
    property Prioridade: Integer read FPrioridade write FPrioridade;
    property DataCriacao: TDateTime read FDataCriacao write FDataCriacao;
    property DataConclusao: TDateTime read FDataConclusao write FDataConclusao;

    procedure Validar;

    function ToJSON: TJSONObject;
    class function FromJSON(AJSON: TJSONObject): TTarefa;
  end;

implementation

{ TTarefa }

class function TTarefa.FromJSON(AJSON: TJSONObject): TTarefa;
begin
  Result := TTarefa.Create;

  if AJSON.TryGetValue<Integer>('Id', Result.FId) = False then
    Result.FId := 0; // novo

  AJSON.TryGetValue<string>('Descricao', Result.FDescricao);
  AJSON.TryGetValue<string>('Status', Result.FStatus);
  AJSON.TryGetValue<Integer>('Prioridade', Result.FPrioridade);

  if AJSON.TryGetValue<TDateTime>('DataCriacao', Result.FDataCriacao) = False then
    Result.FDataCriacao := Now;

  if AJSON.TryGetValue<TDateTime>('DataConclusao', Result.FDataConclusao) = False then
    Result.FDataConclusao := 0;
end;

function TTarefa.ToJSON: TJSONObject;
begin
  Result := TJSONObject.Create;
  Result.AddPair('Id', TJSONNumber.Create(FId));
  Result.AddPair('Descricao', FDescricao);
  Result.AddPair('Status', FStatus);
  Result.AddPair('Prioridade', TJSONNumber.Create(FPrioridade));
  Result.AddPair('DataCriacao', DateToISO8601(FDataCriacao));

  if FDataConclusao = 0 then
    Result.AddPair('DataConclusao', TJSONNull.Create)
  else
    Result.AddPair('DataConclusao', DateToISO8601(FDataConclusao));
end;

procedure TTarefa.Validar;
begin
  if FDescricao.Trim = '' then
    raise Exception.Create('Descrição não pode ser vazia.');

  if FPrioridade < 1 then
    raise Exception.Create('Prioridade deve ser maior ou igual a 1.');

  if ((FStatus <> 'Pendente') and (FStatus <> 'Concluída')) then
    raise Exception.Create('Status inválido.');
end;

end.

