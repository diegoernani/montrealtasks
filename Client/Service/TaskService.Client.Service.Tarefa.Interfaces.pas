unit TaskService.Client.Service.Tarefa.Interfaces;

interface

uses
  System.JSON;

type
  ITaskServiceClient = interface
    ['{E4E3E1E9-4F53-4C6D-9EAA-5AEE028EC6F4}']
    function GetTarefas: TJSONArray;
    procedure AddTarefa(ATarefa: TJSONObject);
    procedure UpdateTarefaStatus(const AId: Integer; const AStatus: string);
    procedure DeleteTarefa(const AId: Integer);
    function GetEstatistica(const AResource: string): TJSONObject;
  end;

implementation

end.

