unit uAluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmAluno = class(TForm)
    dbgAluno: TDBGrid;
    pnlBotoes: TPanel;
    btnExcluir: TBitBtn;
    btnInserir: TBitBtn;
    btnEditar: TBitBtn;
    pnlQuantidadeAluno: TPanel;
    gbxFiltroAluno: TGroupBox;
    cboCampo: TComboBox;
    cboOperacao: TComboBox;
    edtValor: TEdit;
    btnFiltrar: TSpeedButton;
    lblCampo: TLabel;
    lblOperacao: TLabel;
    lblValor: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure dbgAlunoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgAlunoDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
  private
    procedure AbrirEstrutura;
    procedure FecharEstrutura;
    procedure ExcluirAluno;
    procedure CadastrarAluno(const pEditar: Boolean);
    procedure AtualizarQuantidadeAluno;
    procedure PovoarCampos;
    procedure PovoarOperacoes;
    procedure ValidarOpcoesFiltro;
    procedure FiltrarAluno;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uFuncoes, uDM, uCadastroAluno;

{$R *.dfm}

{ TfrmAluno }

procedure TfrmAluno.AbrirEstrutura;
begin
  DM.qryAluno.Open;
  DM.qryUsuario.Open;
end;

procedure TfrmAluno.AtualizarQuantidadeAluno;
begin
  pnlQuantidadeAluno.Caption := IntToStr(DM.qryAluno.RecordCount) + ' Registros ';
end;

procedure TfrmAluno.btnEditarClick(Sender: TObject);
begin
  CadastrarAluno(True);
end;

procedure TfrmAluno.btnExcluirClick(Sender: TObject);
begin
  ExcluirAluno;
  AtualizarQuantidadeAluno;
end;

procedure TfrmAluno.btnFiltrarClick(Sender: TObject);
begin
  ValidarOpcoesFiltro;
  FiltrarAluno;
  AtualizarQuantidadeAluno;
end;

procedure TfrmAluno.btnInserirClick(Sender: TObject);
begin
  CadastrarAluno(False);
  AtualizarQuantidadeAluno;
end;

procedure TfrmAluno.CadastrarAluno(const pEditar: Boolean);
begin
  var lCadastroAluno: TfrmCadastroAluno;
  lCadastroAluno := TfrmCadastroAluno.Create(nil);
  try
    lCadastroAluno.Alterando := pEditar;
    lCadastroAluno.ShowModal;
  finally
    lCadastroAluno.Free;
  end;
end;

procedure TfrmAluno.dbgAlunoDblClick(Sender: TObject);
begin
  CadastrarAluno(True);
end;

procedure TfrmAluno.dbgAlunoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ZebrarGrid(dbgAluno, DM.qryAluno, Rect, Column, State);
end;

procedure TfrmAluno.ExcluirAluno;
begin
  if DM.qryAluno.IsEmpty then
  begin
    Alerta('Não há registros há serem excluídos');
    Exit;
  end;

  if (not Pergunta('Confirma a exclusão do aluno?')) then
    Exit;

  DM.qryAluno.Delete;
end;

procedure TfrmAluno.FecharEstrutura;
begin
  DM.qryAluno.Filtered := False;
  DM.qryAluno.Close;
  DM.qryUsuario.Close;
end;

procedure TfrmAluno.FiltrarAluno;
begin
  var lFiltro: string;
  lFiltro := EmptyStr;
  case cboOperacao.ItemIndex of
    0: lFiltro := cboCampo.Text + '=' + QuotedStr(edtValor.Text);
    1: lFiltro := cboCampo.Text + '<>' + QuotedStr(edtValor.Text);
    2: lFiltro := '';
    3: lFiltro := '';
    4: lFiltro := '';
  end;
  DM.qryAluno.Filter := lFiltro;
  DM.qryAluno.Filtered := False;
  if (Trim(edtValor.Text) <> EmptyStr) then
    DM.qryAluno.Filtered := True;
end;

procedure TfrmAluno.FormActivate(Sender: TObject);
begin
  PovoarCampos;
  PovoarOperacoes;
  AtualizarQuantidadeAluno;
end;

procedure TfrmAluno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FecharEstrutura;
end;

procedure TfrmAluno.FormCreate(Sender: TObject);
begin
  AbrirEstrutura;
end;

procedure TfrmAluno.PovoarCampos;
begin
  cboCampo.Items.Clear;
  var I: integer;
  for I := 0 to DM.qryAluno.Fields.Count - 1 do
    if DM.qryAluno.Fields[I].Visible then
      cboCampo.Items.Add(DM.qryAluno.Fields[I].FieldName);
end;

procedure TfrmAluno.PovoarOperacoes;
begin
  cboOperacao.Items.Clear;
  cboOperacao.Items.Add('Igual');
  cboOperacao.Items.Add('Diferente');
  cboOperacao.Items.Add('Iniciado por');
  cboOperacao.Items.Add('Finalizado por');
  cboOperacao.Items.Add('Que contenha');
end;

procedure TfrmAluno.ValidarOpcoesFiltro;
begin
  if cboCampo.ItemIndex = -1 then
  begin
    Alerta('Selecione o campo');
    cboCampo.SetFocus;
    Abort;
  end;

  if cboOperacao.ItemIndex = -1 then
  begin
    Alerta('Selecione a operação');
    cboOperacao.SetFocus;
    Abort;
  end;
end;

end.
