unit TaskService.Utils.Tarefa;

interface

uses
  System.JSON, ZDataset;

function ConvertQueryToJSONArray(Query: TZQuery): TJSONArray;

implementation

uses
  System.DateUtils, System.SysUtils;

function ConvertQueryToJSONArray(Query: TZQuery): TJSONArray;
var
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
begin
  JSONArray := TJSONArray.Create;

  Query.First;
  while not Query.Eof do
  begin
    JSONObject := TJSONObject.Create;

    JSONObject.AddPair('Id', TJSONNumber.Create(Query.FieldByName('Id').AsInteger));
    JSONObject.AddPair('Descricao', Query.FieldByName('Descricao').AsString);
    JSONObject.AddPair('Status', Query.FieldByName('Status').AsString);
    JSONObject.AddPair('Prioridade', TJSONNumber.Create(Query.FieldByName('Prioridade').AsInteger));

    if not Query.FieldByName('DataCriacao').IsNull then
      JSONObject.AddPair('DataCriacao', DateToISO8601(Query.FieldByName('DataCriacao').AsDateTime))
    else
      JSONObject.AddPair('DataCriacao', TJSONNull.Create);

    if not Query.FieldByName('DataConclusao').IsNull then
      JSONObject.AddPair('DataConclusao', DateToISO8601(Query.FieldByName('DataConclusao').AsDateTime))
    else
      JSONObject.AddPair('DataConclusao', TJSONNull.Create);

    JSONArray.AddElement(JSONObject);
    Query.Next;
  end;

  Result := JSONArray;
end;

end.

