unit TaskService.Utils.Autenticacao;

interface

uses
  Horse,
  TaskService.Controller.Tarefa;

procedure AutenticacaoToken(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

const
  TOKEN_ESPERADO = 'montrealtoken';  //Coloquei o token fixo por questão de didatica mas poderia ter uma função para criar o token com um código Hash por exemplo

procedure AutenticacaoToken(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  Token: string;
begin
  Token := Req.Headers['Authorization'];

  if Token = '' then
  begin
    Res.Status(401).Send('Token não informado');
    Exit;
  end;

  if Token <> TOKEN_ESPERADO then
  begin
    Res.Status(401).Send('Token inválido');
    Exit;
  end;

  if Token = TOKEN_ESPERADO then
    Next();
end;

end.

