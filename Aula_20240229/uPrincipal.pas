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
    procedure ExibirTelaDeMensagem(const pMensagem: TStringList);
    procedure RetornarDadosPreenchidosPeloUsuario(const pNome, pIdade, pCpf, pIdentidade, pSexo, pEstadoCivil, pObservacoes: string;
      out pListaRetorno: TStringList);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  uMensagem;

{$R *.dfm}

procedure TfrmPrincipal.btnGravarClick(Sender: TObject);
begin
  //Realiza a valida��o dos campos obrigat�rios e caso n�o encontre falhas aciona o m�todo de grava��o de dados que retorna uma mensagem formatada para exibi��o ao usu�rio
  ValidarDados;
  var lResultado: TStringList;
  lResultado := TStringList.Create;
  try
    RetornarDadosPreenchidosPeloUsuario(
      edtNome.Text,
      edtIdade.Text,
      edtCpf.Text,
      edtIdentidade.Text,
      cboSexo.Text,
      cboEstadoCivil.Text,
      memObservacoes.Text,
      lResultado);
    ExibirTelaDeMensagem(lResultado);
  finally
    lResultado.Free;
  end;
end;

procedure TfrmPrincipal.ExibirTelaDeMensagem(const pMensagem: TStringList);
begin
  var lTelaMensagem: TfrmMensagem;
  lTelaMensagem := TfrmMensagem.Create(nil);
  try
    lTelaMensagem.ExibirMensagem(pMensagem);
  finally
    lTelaMensagem.Free;
  end;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  //Aciona os m�todos de preenchimento das caixas de sele��o
  PreencherSexo;
  PreencherEstadoCivil;
end;

procedure TfrmPrincipal.RetornarDadosPreenchidosPeloUsuario(const pNome, pIdade, pCpf, pIdentidade, pSexo, pEstadoCivil, pObservacoes: string;
  out pListaRetorno: TStringList);
begin
  //m�todo utilizado para gravar os dados em um TStringList e depois montar uma mensagem de retorno concatenada e separada por quebra de linha

  pListaRetorno.Add('Nome: ' + pNome);
  pListaRetorno.Add('Idade: ' + pIdade);
  pListaRetorno.Add('Cpf: ' + pCpf);
  pListaRetorno.Add('Identidade: ' + pIdentidade);
  pListaRetorno.Add('Sexo: ' + pSexo);
  pListaRetorno.Add('Estado Civil: ' + pEstadoCivil);
  pListaRetorno.Add('Observa��es: ' + pObservacoes);
end;

procedure TfrmPrincipal.PreencherEstadoCivil;
begin
  //m�todo para preenchimento da caixa de sele��o de estado civil
  cboEstadoCivil.Items.Clear;
  cboEstadoCivil.Items.Add('Solteiro');
  cboEstadoCivil.Items.Add('Casado');
  cboEstadoCivil.Items.Add('Divorciado');
  cboEstadoCivil.Items.Add('Vi�vo');
end;

procedure TfrmPrincipal.PreencherSexo;
begin
  //m�todo para preenchimento da caixa de sele��o de sexo
  cboSexo.Items.Clear;
  cboSexo.Items.Add('Feminino');
  cboSexo.Items.Add('Masculino');
end;

procedure TfrmPrincipal.ValidarDados;
begin
  //m�todo para realizar a valida��o dos campos obrigtat�rios; caso algum esteja vazio, o componente recebe foco e interrompe a opera��o totalmente
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
