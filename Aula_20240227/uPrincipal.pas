unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    edtUsuario: TEdit;
    lblUsuario: TLabel;
    btnLogin: TButton;
    procedure btnLoginClick(Sender: TObject);
    procedure edtUsuarioKeyPress(Sender: TObject; var Key: Char);
  private
    procedure ValidarCamposObrigatorios;
    procedure ExibirMensagem(const pMensagem: string);
    procedure ModificarCaptionDaTela(const pMensagem: string);
    procedure Logar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnLoginClick(Sender: TObject);
begin
  Logar;
end;

procedure TfrmPrincipal.edtUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Logar;
end;

procedure TfrmPrincipal.ExibirMensagem(const pMensagem: string);
begin
  ShowMessage('Boa noite ' + pMensagem);
end;

procedure TfrmPrincipal.Logar;
begin
  ValidarCamposObrigatorios;
  ExibirMensagem(edtUsuario.Text);
  ModificarCaptionDaTela(edtUsuario.Text);
end;

procedure TfrmPrincipal.ModificarCaptionDaTela(const pMensagem: string);
begin
  frmPrincipal.Caption := 'Primeira aula';

  if pMensagem = 'andre' then
    frmPrincipal.Caption := 'PRIMEIRA AULA';
end;

procedure TfrmPrincipal.ValidarCamposObrigatorios;
begin
  if edtUsuario.Text = EmptyStr then
  begin
    ShowMessage('Informe o usuário');
    edtUsuario.SetFocus;
    Abort;
  end;
end;

end.
