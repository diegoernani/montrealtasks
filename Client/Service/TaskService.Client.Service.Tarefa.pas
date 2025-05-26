unit TaskService.Client.Service.Tarefa;

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  REST.Client, REST.Types;

type
  TTaskServiceClient = class
  private
    FBaseURL: string;
    FAuthorization: string;
    FRESTClient: TRESTClient;
    FRESTRequest: TRESTRequest;
    FRESTResponse: TRESTResponse;

    procedure ConfigurarRequest(const AResource: string; AMethod: TRESTRequestMethod; ABody: TJSONObject = nil);
  public
    constructor Create(const ABaseURL, AAuthorization: string);
    destructor Destroy; override;

    function GetTarefas: TJSONArray;
    procedure AddTarefa(ATarefa: TJSONObject);
    procedure UpdateTarefaStatus(const AId: Integer; const AStatus: string);
    procedure DeleteTarefa(const AId: Integer);
    function GetEstatistica(const AResource: string): TJSONObject;
  end;

implementation

{ TTaskServiceClient }

constructor TTaskServiceClient.Create(const ABaseURL, AAuthorization: string);
begin
  FBaseURL := ABaseURL;
  FAuthorization := AAuthorization;

  FRESTClient := TRESTClient.Create(FBaseURL);
  FRESTRequest := TRESTRequest.Create(nil);
  FRESTResponse := TRESTResponse.Create(nil);

  FRESTRequest.Client := FRESTClient;
  FRESTRequest.Response := FRESTResponse;
end;

destructor TTaskServiceClient.Destroy;
begin
  FRESTRequest.Free;
  FRESTResponse.Free;
  FRESTClient.Free;
  inherited;
end;

procedure TTaskServiceClient.ConfigurarRequest(const AResource: string; AMethod: TRESTRequestMethod; ABody: TJSONObject);
begin
  FRESTRequest.ResetToDefaults;
  FRESTRequest.Resource := AResource;
  FRESTRequest.Method := AMethod;

  FRESTRequest.Params.Clear;
  FRESTRequest.AddParameter('Authorization', FAuthorization, pkHTTPHEADER);

  if Assigned(ABody) then
  begin
    FRESTRequest.Body.Add(ABody.ToJSON, TRESTContentType.ctAPPLICATION_JSON);
  end;
end;

function TTaskServiceClient.GetTarefas: TJSONArray;
begin
  ConfigurarRequest('tarefas', rmGET);
  FRESTRequest.Execute;

  Result := TJSONObject.ParseJSONValue(FRESTResponse.Content) as TJSONArray;
end;

procedure TTaskServiceClient.AddTarefa(ATarefa: TJSONObject);
begin
  ConfigurarRequest('tarefas', rmPOST, ATarefa);
  FRESTRequest.Execute;
end;

procedure TTaskServiceClient.UpdateTarefaStatus(const AId: Integer; const AStatus: string);
var
  JSON: TJSONObject;
begin
  JSON := TJSONObject.Create;
  try
    JSON.AddPair('Status', AStatus);
    ConfigurarRequest(Format('tarefas/%d/status', [AId]), rmPUT, JSON);
    FRESTRequest.Execute;
  finally
    JSON.Free;
  end;
end;

procedure TTaskServiceClient.DeleteTarefa(const AId: Integer);
begin
  ConfigurarRequest(Format('tarefas/%d', [AId]), rmDELETE);
  FRESTRequest.Execute;
end;

function TTaskServiceClient.GetEstatistica(const AResource: string): TJSONObject;
begin
  ConfigurarRequest(AResource, rmGET);
  FRESTRequest.Execute;

  Result := TJSONObject.ParseJSONValue(FRESTResponse.Content) as TJSONObject;
end;

end.

