unit TaskService.Repository.Conexao;

interface

uses
  ZConnection, ZDataset;

function GetConnection: TZConnection;

implementation

uses
  System.SysUtils;

var
  FConexao: TZConnection;

function GetConnection: TZConnection;
begin
  if not Assigned(FConexao) then
  begin
    FConexao := TZConnection.Create(nil);
    FConexao.Protocol := 'mssql';
    FConexao.LibraryLocation := 'C:\Users\Diego\Desktop\Montreal Tasks\Service\DLL\sybdb.dll';
    FConexao.HostName := '127.0.0.1';
    FConexao.Port := 50172;
    FConexao.Database := 'Montreal';
    try
      FConexao.Connect;
    except
      on E: Exception do
        raise Exception.CreateFmt('Erro ao conectar no banco %s em %s:%d - %s com DLL %s',
          [FConexao.Database, FConexao.HostName, FConexao.Port, FConexao.LibraryLocation, E.Message]);
    end;
  end;
  Result := FConexao;
end;

initialization
  // Nenhuma inicialização necessária.

finalization
  FreeAndNil(FConexao);

end.

