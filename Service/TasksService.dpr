program TasksService;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  TasksService.Model.Tarefa in 'Model\TasksService.Model.Tarefa.pas',
  TasksService.Controller.Tarefa in 'Controller\TasksService.Controller.Tarefa.pas',
  TaskService.Repository.Conexao in 'Repository\TaskService.Repository.Conexao.pas',
  TaskService.Utils.Tarefa in 'Utils\TaskService.Utils.Tarefa.pas',
  TaskService.Repository.Tarefa in 'Repository\TaskService.Repository.Tarefa.pas',
  TaskService.Utils.Autenticacao in 'Utils\TaskService.Utils.Autenticacao.pas',
  Horse;

begin
  THorse.Use(AutenticacaoToken);
  try
    RegisterTarefaRoutes;

    Writeln('Service Montreal rodando em http://localhost:9000');
    THorse.Listen(9000);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
