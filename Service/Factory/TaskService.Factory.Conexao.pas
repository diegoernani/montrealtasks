unit TaskService.Factory.Conexao;

interface

uses
  ZConnection;

type
  TConnectionFactory = class
  public
    class function CreateConnection: TZConnection;
  end;

implementation

uses
  System.SysUtils;

{ TConnectionFactory }

class function TConnectionFactory.CreateConnection: TZConnection;
var
  Conn: TZConnection;
begin
  Conn := TZConnection.Create(nil);

  // Aqui você pode ajustar conforme o ambiente ou carregar de um .ini
  Conn.Protocol := 'mssql';
  Conn.LibraryLocation := 'C:\Users\Diego\Desktop\Montreal Tasks\Service\DLL\sybdb.dll';
  Conn.HostName := '127.0.0.1';
  Conn.Port := 50172;
  Conn.Database := 'Montreal';

  try
    Conn.Connect;
  except
    on E: Exception do
    begin
      Conn.Free;
      raise Exception.Create('Erro ao conectar: ' + E.Message);
    end;
  end;

  Result := Conn;
end;

end.

