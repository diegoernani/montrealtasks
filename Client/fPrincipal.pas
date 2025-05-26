unit fPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.WinXPanels, Vcl.StdCtrls, System.Skia, Vcl.Skia;

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
    lbConcluida7Dias: TLabel;
    Label17: TLabel;
    Panel14: TPanel;
    botaoFechar: TLabel;
    Panel15: TPanel;
    Label19: TLabel;
    procedure botaoAtualizarClick(Sender: TObject);
    procedure botaoFecharClick(Sender: TObject);
    procedure botaoTarefasClick(Sender: TObject);
    procedure botaoEstatisticaClick(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Label19Click(Sender: TObject);
    procedure lbInserirTarefaClick(Sender: TObject);
    procedure lbEditarTarefaClick(Sender: TObject);
    procedure lbExcluirTarefaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarTarefas;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  System.JSON, TaskService.Client.Service.Tarefa;

{$R *.dfm}

procedure TForm1.botaoAtualizarClick(Sender: TObject);
begin
  CarregarTarefas;
  PageControl1.ActivePage := tbMinhasTarefas;
end;

procedure TForm1.botaoEstatisticaClick(Sender: TObject);
begin
  PageControl1.ActivePage := tbEstatistica;
end;

procedure TForm1.botaoFecharClick(Sender: TObject);
begin
  //limpar campos e voltar a listagem
  PageControl1.ActivePage := tbMinhasTarefas;
end;

procedure TForm1.botaoTarefasClick(Sender: TObject);
begin
  PageControl1.ActivePage := tbMinhasTarefas;
end;

procedure TForm1.CarregarTarefas;
var
  LClient: TTaskServiceClient;
  Tarefas: TJSONArray;
  TarefaObj: TJSONObject;
  i: Integer;
  Item: TListItem;
begin
  LClient := TTaskServiceClient.Create('http://localhost:9000/', 'montrealtoken');
  try
    Tarefas := LClient.GetTarefas;
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
  finally
    LClient.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CarregarTarefas;
end;

procedure TForm1.Label11Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Label19Click(Sender: TObject);
begin
  //gravar na api
  PageControl1.ActivePage := tbMinhasTarefas;
end;

procedure TForm1.lbEditarTarefaClick(Sender: TObject);
var
  SelectedItem: TListItem;
  Id: Integer;
  NovoStatus: string;
  LCliente: TTaskServiceClient;
begin
  LCliente := TTaskServiceClient.Create('http://localhost:9000/', 'montrealtoken');
  try
    SelectedItem := ListView1.Selected;
    if not Assigned(SelectedItem) then
    begin
      ShowMessage('Selecione uma tarefa para editar.');
      Exit;
    end;

    Id := StrToIntDef(SelectedItem.Caption, 0); // Ajuste se o Id estiver na SubItem ou Tag
    NovoStatus := InputBox('Editar Status', 'Novo Status:', SelectedItem.SubItems[1]);

    if NovoStatus <> '' then
    begin
      LCliente.UpdateTarefaStatus(Id, NovoStatus);
      ShowMessage('Status atualizado!');
      CarregarTarefas;
    end;
  finally
    LCliente.Free;
  end;
end;

procedure TForm1.lbExcluirTarefaClick(Sender: TObject);
var
  SelectedItem: TListItem;
  Id: Integer;
  LCliente: TTaskServiceClient;
begin
  LCliente := TTaskServiceClient.Create('http://localhost:9000/', 'montrealtoken');
  try
    SelectedItem := ListView1.Selected;
    if not Assigned(SelectedItem) then
    begin
      ShowMessage('Selecione uma tarefa para excluir.');
      Exit;
    end;

    Id := StrToIntDef(SelectedItem.SubItems[0], 0);

    if MessageDlg('Deseja excluir a tarefa?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      LCliente.DeleteTarefa(Id);
      ShowMessage('Tarefa excluída!');
      CarregarTarefas;
    end;
  finally
    LCliente.Free;
  end;
end;

procedure TForm1.lbInserirTarefaClick(Sender: TObject);
var
  Descricao, Status, PrioridadeStr: string;
  Prioridade: Integer;
  TarefaJSON: TJSONObject;
  LCliente: TTaskServiceClient;
begin
  LCliente := TTaskServiceClient.Create('http://localhost:9000/', 'montrealtoken');
  try
     PageControl1.ActivePage := tbEdicao;
    Descricao := InputBox('Nova Tarefa', 'Descrição:', '');
    if Descricao = '' then Exit;

    Status := InputBox('Nova Tarefa', 'Status (Pendente/Concluída):', 'Pendente');
    if Status = '' then Exit;

    PrioridadeStr := InputBox('Nova Tarefa', 'Prioridade (1-5):', '1');
    if not TryStrToInt(PrioridadeStr, Prioridade) then
    begin
      ShowMessage('Prioridade inválida!');
      Exit;
    end;

    TarefaJSON := TJSONObject.Create;
    try
      TarefaJSON.AddPair('Descricao', Descricao);
      TarefaJSON.AddPair('Status', Status);
      TarefaJSON.AddPair('Prioridade', TJSONNumber.Create(Prioridade));

      LCliente.AddTarefa(TarefaJSON);
      ShowMessage('Tarefa adicionada com sucesso!');

      CarregarTarefas;
    finally
      TarefaJSON.Free;
    end;
  finally
    LCliente.Free;
  end;
end;



end.
