unit TaskService.Utils.Autenticacao;

interface

uses
  Horse,
  TaskService.Controller.Tarefa;

procedure AutenticacaoToken(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

uses
  System.NetEncoding, System.SysUtils;

const
  TOKEN_ESPERADO = 'montrealtoken';  //Coloquei o token fixo por questão de didatica mas poderia ter uma função para criar o token com um código Hash por exemplo

procedure AutenticacaoToken(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Token: string;
begin
  Token := Req.Headers['Authorization'];
  Writeln('Token recebido: "' + Token + '"');

  if Token = '' then
  begin
    Res.Send('Token não informado').Status(401);
    raise EHorseCallbackInterrupted.Create();
  end;

  if Token <> TOKEN_ESPERADO then
  begin
    Res.Send('Token não informado').Status(401);
    raise EHorseCallbackInterrupted.Create();
  end;

  Next();
end;

end.

