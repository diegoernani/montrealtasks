program TasksService;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  TasksService.Model.Tarefa in 'Model\TasksService.Model.Tarefa.pas',
  TasksService.Controller.Tarefa in 'Controller\TasksService.Controller.Tarefa.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
