program TasksClient;

uses
  Vcl.Forms,
  fPrincipal in 'fPrincipal.pas' {Form1},
  TaskService.Client.Service.Tarefa in 'Service\TaskService.Client.Service.Tarefa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
