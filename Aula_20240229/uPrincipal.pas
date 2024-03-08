unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    pnlPrincipal: TPanel;
    pnlBotoes: TPanel;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    lblNome: TLabel;
    edtNome: TEdit;
    lblIdade: TLabel;
    edtIdade: TEdit;
    lblCpf: TLabel;
    edtCpf: TEdit;
    edtIdentidade: TEdit;
    lblIdentidade: TLabel;
    lblSexo: TLabel;
    cboSexo: TComboBox;
    lblEstadoCivil: TLabel;
    cboEstadoCivil: TComboBox;
    lblObservacoes: TLabel;
    memObservacoes: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    procedure PreencherSexo;
    procedure PreencherEstadoCivil;
    procedure ValidarDados;
    function GravarDados(const pNome, pIdade, pCpf, pIdentidade, pSexo, pEstadoCivil: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnGravarClick(Sender: TObject);
begin
  ValidarDados;
  ShowMessage(GravarDados(
    edtNome.Text,
    edtIdade.Text,
    edtCpf.Text,
    edtIdentidade.Text,
    cboSexo.Text,
    cboEstadoCivil.Text));
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  PreencherSexo;
  PreencherEstadoCivil;
end;

function TfrmPrincipal.GravarDados(const pNome, pIdade, pCpf, pIdentidade, pSexo, pEstadoCivil: string): string;
begin
  var lResultado: TStringList;
  lResultado := TStringList.Create;
  try
    lResultado.Add('Nome: ' + pNome);
    lResultado.Add('Idade: ' + pIdade);
    lResultado.Add('Cpf: ' + pCpf);
    lResultado.Add('Identidade: ' + pIdentidade);
    lResultado.Add('Sexo: ' + pSexo);
    lResultado.Add('Estado Civil: ' + pEstadoCivil);

    var lValor, lMensagem: string;
    for lValor in lResultado do
      lMensagem := lMensagem + lValor + sLineBreak;

    Result := lMensagem;
  finally
    lResultado.Free;
  end;
end;

procedure TfrmPrincipal.PreencherEstadoCivil;
begin
  cboEstadoCivil.Items.Clear;
  cboEstadoCivil.Items.Add('Solteiro');
  cboEstadoCivil.Items.Add('Casado');
  cboEstadoCivil.Items.Add('Divorciado');
  cboEstadoCivil.Items.Add('Viúvo');
end;

procedure TfrmPrincipal.PreencherSexo;
begin
  cboSexo.Items.Clear;
  cboSexo.Items.Add('Feminino');
  cboSexo.Items.Add('Masculino');
end;

procedure TfrmPrincipal.ValidarDados;
begin
  if Trim(edtNome.Text).IsEmpty then
  begin
    ShowMessage('Informe o nome');
    edtNome.SetFocus;
    Abort;
  end;

  if Trim(edtIdade.Text).IsEmpty then
  begin
    ShowMessage('Informe a idade');
    edtIdade.SetFocus;
    Abort;
  end;

  if Trim(edtCpf.Text).IsEmpty then
  begin
    ShowMessage('Informe o cpf');
    edtCpf.SetFocus;
    Abort;
  end;

  if cboSexo.ItemIndex = -1 then
  begin
    ShowMessage('Selecione o sexo');
    cboSexo.SetFocus;
    Abort;
  end;
end;

end.
