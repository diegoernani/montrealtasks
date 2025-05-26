unit fPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.WinXPanels, Vcl.StdCtrls,
  System.Skia, Vcl.Skia, TaskService.Client.Service.Tarefa.Interfaces,
  TaskService.Client.Service.Tarefa.REST4D;

type
  TForm1 = class(TForm)
    pHeader: TPanel;
    pTitulo: TPanel;
    pMenu: TPanel;
    Label5: TLabel;
    btAtualizar: TPanel;
    botaoAtualizar: TLabel;
    Panel1: TPanel;
    botaoEstatistica: TLabel;
    Panel2: TPanel;
    botaoTarefas: TLabel;
    Panel3: TPanel;
    Label8: TLabel;
    Panel5: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Panel6: TPanel;
    PageControl1: TPageControl;
    tbMinhasTarefas: TTabSheet;
    tbEstatistica: TTabSheet;
    ListView1: TListView;
    Label3: TLabel;
    Panel7: TPanel;
    lbEditarTarefa: TLabel;
    Panel8: TPanel;
    lbExcluirTarefa: TLabel;
    Panel9: TPanel;
    Label11: TLabel;
    SkSvg1: TSkSvg;
    Panel10: TPanel;
    lbInserirTarefa: TLabel;
    tbEdicao: TTabSheet;
    Panel11: TPanel;
    Label13: TLabel;
    lbTotalTarefas: TLabel;
    Panel12: TPanel;
    Label14: TLabel;
    lbMediaPrioridade: TLabel;
    Panel13: TPanel;
    lb3: TLabel;
    lbConcluida7Dias: TLabel;
    Panel14: TPanel;
    botaoCancel: TLabel;
    Panel15: TPanel;
    botaoOk: TLabel;
    edID: TEdit;
    edDescricao: TEdit;
    edPrioridade: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    cdStatus: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    procedure botaoAtualizarClick(Sender: TObject);
    procedure botaoCancelClick(Sender: TObject);
    procedure botaoTarefasClick(Sender: TObject);
    procedure botaoEstatisticaClick(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure botaoOkClick(Sender: TObject);
    procedure lbInserirTarefaClick(Sender: TObject);
    procedure lbEditarTarefaClick(Sender: TObject);
    procedure lbExcluirTarefaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FClient: ITaskServiceClient;
    procedure CarregarTarefas;
    procedure AtualizarEstatisticas;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  System.JSON,
  System.UITypes,
  System.Generics.Collections;

{$R *.dfm}

procedure TForm1.botaoAtualizarClick(Sender: TObject);
begin
  CarregarTarefas;
  AtualizarEstatisticas;
  PageControl1.ActivePage := tbMinhasTarefas;
end;

procedure TForm1.botaoEstatisticaClick(Sender: TObject);
begin
  AtualizarEstatisticas;
  PageControl1.ActivePage := tbEstatistica;
end;

procedure TForm1.botaoCancelClick(Sender: TObject);
begin
  // Limpa e volta
  edID.Text := '';
  edDescricao.Text := '';
  cdStatus.Text := '';
  edPrioridade.Text := '';

  PageControl1.ActivePage := tbMinhasTarefas;
end;

procedure TForm1.botaoTarefasClick(Sender: TObject);
begin
  AtualizarEstatisticas;
  PageControl1.ActivePage := tbMinhasTarefas;
end;

procedure TForm1.CarregarTarefas;
var
  Tarefas: TJSONArray;
  TarefaObj: TJSONObject;
  i: Integer;
  Item: TListItem;
begin


  Tarefas := FClient.GetTarefas;
  try
    ListView1.Items.Clear;

    for i := 0 to Tarefas.Count - 1 do
    begin
      TarefaObj := Tarefas.Items[i] as TJSONObject;

      Item := ListView1.Items.Add;
      Item.Caption := TarefaObj.GetValue<string>('Id');
      Item.SubItems.Add(TarefaObj.GetValue<string>('Descricao'));
      Item.SubItems.Add(TarefaObj.GetValue<string>('Status'));
      Item.SubItems.Add(TarefaObj.GetValue<string>('Prioridade'));
      Item.SubItems.Add(DateTimeToStr(TarefaObj.GetValue<TDateTime>('DataCriacao')));

      if not TarefaObj.GetValue<String>('DataConclusao').IsEmpty and (TarefaObj.GetValue<TDateTime>('DataConclusao') > 0) then
        Item.SubItems.Add(DateTimeToStr(TarefaObj.GetValue<TDateTime>('DataConclusao')));
    end;

  finally
    Tarefas.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FClient := TTaskServiceClientREST4D.Create('http://localhost:9000/', 'montrealtoken');
  CarregarTarefas;
  AtualizarEstatisticas;
end;

procedure TForm1.Label11Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.botaoOkClick(Sender: TObject);
var
  TarefaJSON: TJSONObject;
  Id: Integer;
begin
  if edID.Text = '' then
  begin
    // Inserção
    TarefaJSON := TJSONObject.Create;
    try
      TarefaJSON.AddPair('Descricao', edDescricao.Text);
      TarefaJSON.AddPair('Status', cdStatus.Text);
      TarefaJSON.AddPair('Prioridade', TJSONNumber.Create(StrToIntDef(edPrioridade.Text, 1)));

      FClient.AddTarefa(TarefaJSON);
      ShowMessage('Tarefa adicionada com sucesso.');
    finally
      TarefaJSON.Free;
    end;
  end
  else
  begin
    // Edição → só Status
    Id := StrToIntDef(edID.Text, 0);
    FClient.UpdateTarefaStatus(Id, cdStatus.Text);
    ShowMessage('Status atualizado.');
  end;

  CarregarTarefas;
  PageControl1.ActivePage := tbMinhasTarefas;
end;

procedure TForm1.lbEditarTarefaClick(Sender: TObject);
var
  SelectedItem: TListItem;
begin
  SelectedItem := ListView1.Selected;
  if not Assigned(SelectedItem) then
  begin
    ShowMessage('Selecione uma tarefa para editar.');
    Exit;
  end;

  // Preenche os campos
  edID.Text := SelectedItem.Caption;
  edDescricao.Text := SelectedItem.SubItems[0];   // Descricao
  cdStatus.Text := SelectedItem.SubItems[1];      // Status
  edPrioridade.Text := SelectedItem.SubItems[2];  // Prioridade

  // Apenas Status habilitado
  edDescricao.Enabled := False;
  edPrioridade.Enabled := False;
  cdStatus.Enabled := True;

  PageControl1.ActivePage := tbEdicao;
end;

procedure TForm1.lbExcluirTarefaClick(Sender: TObject);
var
  SelectedItem: TListItem;
  Id: Integer;
begin
  SelectedItem := ListView1.Selected;
  if not Assigned(SelectedItem) then
  begin
    ShowMessage('Selecione uma tarefa para excluir.');
    Exit;
  end;

  Id := StrToIntDef(SelectedItem.Caption, 0);

  if MessageDlg('Deseja excluir a tarefa?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FClient.DeleteTarefa(Id);
    ShowMessage('Tarefa excluída.');
    CarregarTarefas;
  end;
end;

procedure TForm1.lbInserirTarefaClick(Sender: TObject);
begin
// Limpa os campos
  edID.Text := '';
  edDescricao.Text := '';
  cdStatus.Text := 'Pendente'; // Valor default
  edPrioridade.Text := '1';

  // Todos habilitados
  edDescricao.Enabled := True;
  cdStatus.Enabled := True;
  edPrioridade.Enabled := True;

  PageControl1.ActivePage := tbEdicao;
end;

procedure TForm1.AtualizarEstatisticas;
var
  TotalJSON, MediaJSON, ConcluidasJSON: TJSONObject;
begin
  try
    // Total de Tarefas
    TotalJSON := FClient.GetEstatistica('tarefas/total');
    try
      lbTotalTarefas.Caption := TotalJSON.GetValue<string>('resultado');
    finally
      TotalJSON.Free;
    end;

    // Média de Prioridade Pendentes
    MediaJSON := FClient.GetEstatistica('tarefas/media-prioridade-pendentes');
    try
      lbMediaPrioridade.Caption := MediaJSON.GetValue<string>('resultado');
    finally
      MediaJSON.Free;
    end;

    // Concluídas nos últimos 7 dias
    ConcluidasJSON := FClient.GetEstatistica('tarefas/concluidas-7-dias');
    try
      lbConcluida7Dias.Caption := ConcluidasJSON.GetValue<string>('resultado');
    finally
      ConcluidasJSON.Free;
    end;

  except
    on E: Exception do
      ShowMessage('Erro ao atualizar estatísticas: ' + E.Message);
  end;
end;


end.
