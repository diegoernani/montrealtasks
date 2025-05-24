unit TasksService.Model.Tarefa;

interface

uses
  System.SysUtils;

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
  end;

implementation

end.

