unit uCadastroAluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadastroAluno = class(TForm)
    pnlDados: TPanel;
    pnlBotoes: TPanel;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    dbeMatricula: TDBEdit;
    dbeNome: TDBEdit;
    dbeCurso: TDBEdit;
    lblMatricula: TLabel;
    lblNome: TLabel;
    lblCurso: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    FAlterando: Boolean;
    procedure PrepararAmbiente;
    procedure Cancelar;
    procedure ValidarDados;
    procedure GravarDados;
    { Private declarations }
  public
    property Alterando: Boolean write FAlterando;
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDM, uFuncoes, Data.DB;

{ TfrmCadastroAluno }

procedure TfrmCadastroAluno.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TfrmCadastroAluno.btnGravarClick(Sender: TObject);
begin
  ValidarDados;
  GravarDados;
end;

procedure TfrmCadastroAluno.Cancelar;
begin
  DM.qryAluno.Cancel;
  Close;
end;

procedure TfrmCadastroAluno.FormActivate(Sender: TObject);
begin
  PrepararAmbiente;
end;

procedure TfrmCadastroAluno.GravarDados;
begin
  if DM.qryAluno.State = dsBrowse then
  begin
    Alerta('Cadastro n�o est� em inser��o ou edi��o');
    Exit;
  end;

  DM.qryAluno.Post;
  Informacao('Opera��o conclu�da com sucesso');
  Close;
end;

procedure TfrmCadastroAluno.PrepararAmbiente;
begin
  if FAlterando then
    begin
      DM.qryAluno.Edit;
      Caption := 'Aluno [Inserindo]';
    end
  else
    begin
      DM.qryAluno.Append;
      Caption := 'Aluno [Editando]';
    end;

  dbeMatricula.SetFocus;
end;

procedure TfrmCadastroAluno.ValidarDados;
begin
  if dbeMatricula.Text = EmptyStr then
  begin
    Alerta('Informe a matr�cula');
    dbeMatricula.SetFocus;
    Abort;
  end;

  if dbeNome.Text = EmptyStr then
  begin
    Alerta('Informe o nome');
    dbeNome.SetFocus;
    Abort;
  end;

  if dbeCurso.Text = EmptyStr then
  begin
    Alerta('Informe o curso');
    dbeCurso.SetFocus;
    Abort;
  end;
end;

end.