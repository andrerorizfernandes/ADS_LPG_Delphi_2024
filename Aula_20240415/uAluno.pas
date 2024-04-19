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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    procedure AbrirEstrutura;
    procedure FecharEstrutura;
    procedure ExcluirAluno;
    procedure CadastrarAluno(const pEditar: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAluno: TfrmAluno;

implementation

uses
  uFuncoes, uDM, uCadastroAluno;

{$R *.dfm}

{ TfrmAluno }

procedure TfrmAluno.AbrirEstrutura;
begin
  DM.qryAluno.Open;
end;

procedure TfrmAluno.btnEditarClick(Sender: TObject);
begin
  CadastrarAluno(True);
end;

procedure TfrmAluno.btnExcluirClick(Sender: TObject);
begin
  ExcluirAluno;
end;

procedure TfrmAluno.btnInserirClick(Sender: TObject);
begin
  CadastrarAluno(False);
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
  DM.qryAluno.Close;
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
