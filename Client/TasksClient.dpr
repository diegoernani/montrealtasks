program TasksClient;

uses
  Vcl.Forms,
  fPrincipal in 'fPrincipal.pas' {Form1},
  TaskService.Client.Service.Tarefa in 'Service\TaskService.Client.Service.Tarefa.pas',
  TaskService.Client.Service.Tarefa.Interfaces in 'Service\TaskService.Client.Service.Tarefa.Interfaces.pas',
  TaskService.Client.Service.Tarefa.REST4D in 'Service\TaskService.Client.Service.Tarefa.REST4D.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
