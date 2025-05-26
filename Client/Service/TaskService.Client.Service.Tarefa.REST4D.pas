unit TaskService.Client.Service.Tarefa.REST4D;

interface

uses
  System.JSON, TaskService.Client.Service.Tarefa.Interfaces,
  RESTRequest4D.Request.Client, RESTRequest4D.Response.Contract,
  System.Generics.Collections, System.Generics.Defaults, RESTRequest4D;

type
  TTaskServiceClientREST4D = class(TInterfacedObject, ITaskServiceClient)
  private
    FBaseURL: string;
    FAuthorization: string;
    procedure CheckResponse(const AResponse: IResponse);
  public
    constructor Create(const ABaseURL, AAuthorization: string);

    function GetTarefas: TJSONArray;
    procedure AddTarefa(ATarefa: TJSONObject);
    procedure UpdateTarefaStatus(const AId: Integer; const AStatus: string);
    procedure DeleteTarefa(const AId: Integer);
    function GetEstatistica(const AResource: string): TJSONObject;
  end;

implementation

uses
  System.SysUtils;

{ TTaskServiceClientREST4D }

constructor TTaskServiceClientREST4D.Create(const ABaseURL, AAuthorization: string);
begin
  FBaseURL := ABaseURL;
  FAuthorization := AAuthorization;
end;

procedure TTaskServiceClientREST4D.CheckResponse(const AResponse: IResponse);
begin
  if not AResponse.StatusCode.ToString.StartsWith('2') then
    raise Exception.Create('Erro HTTP ' + AResponse.StatusCode.ToString + ': ' + AResponse.Content);
end;

function TTaskServiceClientREST4D.GetTarefas: TJSONArray;
var
  LResponse: IResponse;
begin
  LResponse := TRequest.New.BaseURL(FBaseURL)
                         .Resource('tarefas')
                         .AddHeader('Authorization', FAuthorization)
                         .Get;

  CheckResponse(LResponse);

  Result := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONArray;
end;

procedure TTaskServiceClientREST4D.AddTarefa(ATarefa: TJSONObject);
var
  LResponse: IResponse;
begin
  LResponse := TRequest.New.BaseURL(FBaseURL)
                        .Resource('tarefas')
                        .AddHeader('Authorization', FAuthorization)
                        .AddBody(ATarefa.ToJSON)
                        .Post;

  CheckResponse(LResponse);
end;

procedure TTaskServiceClientREST4D.UpdateTarefaStatus(const AId: Integer; const AStatus: string);
var
  LBody: TJSONObject;
  LResponse: IResponse;
begin
  LBody := TJSONObject.Create;
  try
    LBody.AddPair('Status', AStatus);

    LResponse := TRequest.New.BaseURL(FBaseURL)
                          .Resource(Format('tarefas/%d/status', [AId]))
                          .AddHeader('Authorization', FAuthorization)
                          .AddBody(LBody.ToJSON)
                          .Put;

    CheckResponse(LResponse);
  finally
    LBody.Free;
  end;
end;

procedure TTaskServiceClientREST4D.DeleteTarefa(const AId: Integer);
var
  LResponse: IResponse;
begin
  LResponse := TRequest.New.BaseURL(FBaseURL)
                          .Resource(Format('tarefas/%d', [AId]))
                          .AddHeader('Authorization', FAuthorization)
                          .Delete;

  CheckResponse(LResponse);
end;

function TTaskServiceClientREST4D.GetEstatistica(const AResource: string): TJSONObject;
var
  LResponse: IResponse;
begin
  LResponse := TRequest.New.BaseURL(FBaseURL)
                         .Resource(AResource)
                         .AddHeader('Authorization', FAuthorization)
                         .Get;

  CheckResponse(LResponse);

  Result := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONObject;
end;

end.

