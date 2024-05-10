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
    procedure edtValorChange(Sender: TObject);
  private
    procedure AbrirEstrutura;
    procedure FecharEstrutura;
    procedure ExcluirAluno;
    procedure CadastrarAluno(const pEditar: Boolean);
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

procedure TfrmAluno.btnEditarClick(Sender: TObject);
begin
  CadastrarAluno(True);
end;

procedure TfrmAluno.btnExcluirClick(Sender: TObject);
begin
  ExcluirAluno;
  AtualizarQuantidade(pnlQuantidadeAluno, DM.qryAluno);
end;

procedure TfrmAluno.btnFiltrarClick(Sender: TObject);
begin
  FiltrarAluno;
end;

procedure TfrmAluno.btnInserirClick(Sender: TObject);
begin
  CadastrarAluno(False);
  AtualizarQuantidade(pnlQuantidadeAluno, DM.qryAluno);
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

procedure TfrmAluno.edtValorChange(Sender: TObject);
begin
  FiltrarAluno;
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
  FiltrarDados(cboCampo, cboOperacao, DM.qryAluno, edtValor.Text);
  AtualizarQuantidade(pnlQuantidadeAluno, DM.qryAluno);
end;

procedure TfrmAluno.FormActivate(Sender: TObject);
begin
  PovoarCampos(cboCampo, DM.qryAluno);
  PovoarOperacoes(cboOperacao);
  AtualizarQuantidade(pnlQuantidadeAluno, DM.qryAluno);
end;

procedure TfrmAluno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FecharEstrutura;
end;

procedure TfrmAluno.FormCreate(Sender: TObject);
begin
  AbrirEstrutura;
end;

end.
