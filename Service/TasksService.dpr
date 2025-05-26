program TasksService;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  TaskService.Model.Tarefa in 'Model\TaskService.Model.Tarefa.pas',
  TaskService.Controller.Tarefa in 'Controller\TaskService.Controller.Tarefa.pas',
  TaskService.Utils.Tarefa in 'Utils\TaskService.Utils.Tarefa.pas',
  TaskService.Repository.Tarefa in 'Repository\TaskService.Repository.Tarefa.pas',
  TaskService.Utils.Autenticacao in 'Utils\TaskService.Utils.Autenticacao.pas',
  TaskService.Factory.Conexao in 'Factory\TaskService.Factory.Conexao.pas',
  Horse;

begin
  THorse.Use(AutenticacaoToken); //Autenticação básica usando token
  try
    RegisterTarefaRoutes;  //Registro de rotas usando Horse

    Writeln('TasksService Montreal - rodando em http://localhost:9000');
    THorse.Listen(9000);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
