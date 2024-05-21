unit uCadastroEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadastroEmpresa = class(TForm)
    pnlBotoes: TPanel;
    btnCancelar: TBitBtn;
    btnInserir: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    pnlCnpj: TPanel;
    pnlCampos: TPanel;
    lblCnpj: TLabel;
    edtCnpj: TEdit;
    btnPesquisaCnpj: TBitBtn;
    lblNome: TLabel;
    dbeNome: TDBEdit;
    lblTipo: TLabel;
    dbeTipo: TDBEdit;
    lblFantasia: TLabel;
    dbeFantasia: TDBEdit;
    lblNaturezaJuridica: TLabel;
    dbeNaturezaJuridica: TDBEdit;
    lblLogradouro: TLabel;
    dbeLogradouro: TDBEdit;
    lblNumero: TLabel;
    dbeNumero: TDBEdit;
    lblBairro: TLabel;
    dbeBairro: TDBEdit;
    lblMunicipio: TLabel;
    dbeMunicipio: TDBEdit;
    lblUf: TLabel;
    dbeUf: TDBEdit;
    lblCep: TLabel;
    dbeCep: TDBEdit;
    procedure btnPesquisaCnpjClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    procedure CarregarEmpresa(const pCnpj: string);
    procedure ValidarCnpj(const pCnpj: string);
    procedure ControlarVisibilidadeCampos;
    procedure GravarDados;
    procedure RecuperarDadosEmpresaWebService(const pCnpj: string);
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uDM, uFuncoes, Data.DB, uWebServiceEmpresa;

{$R *.dfm}

procedure TfrmCadastroEmpresa.btnCancelarClick(Sender: TObject);
begin
  DM.qryEmpresa.Cancel;
  PassarParametro(DM.qryEmpresa, [-1]);
  edtCnpj.Clear;
  edtCnpj.SetFocus;
  ControlarBotoes(Navegando, btnInserir, btnEditar, btnExcluir, btnGravar, btnCancelar);
end;

procedure TfrmCadastroEmpresa.btnEditarClick(Sender: TObject);
begin
  ControlarBotoes(Editando, btnInserir, btnEditar, btnExcluir, btnGravar, btnCancelar);
  DM.qryEmpresa.Edit;
  ControlarVisibilidadeCampos;
  dbeNome.SetFocus;
end;

procedure TfrmCadastroEmpresa.btnExcluirClick(Sender: TObject);
begin
  if (not Pergunta('Deseja excluir a empresa?')) then
   Exit;

  DM.qryEmpresa.Delete;
  edtCnpj.Clear;
  edtCnpj.SetFocus;
  ControlarBotoes(Navegando, btnInserir, btnEditar, btnExcluir, btnGravar, btnCancelar);
end;

procedure TfrmCadastroEmpresa.btnGravarClick(Sender: TObject);
begin
  ValidarCnpj(edtCnpj.Text);
  GravarDados;
  ControlarBotoes(Navegando, btnInserir, btnEditar, btnExcluir, btnGravar, btnCancelar);
end;

procedure TfrmCadastroEmpresa.btnInserirClick(Sender: TObject);
begin
  ControlarBotoes(Inserindo, btnInserir, btnEditar, btnExcluir, btnGravar, btnCancelar);
  DM.qryEmpresa.Append;
  RecuperarDadosEmpresaWebService(edtCnpj.Text);
  ControlarVisibilidadeCampos;
  edtCnpj.SetFocus;
end;

procedure TfrmCadastroEmpresa.btnPesquisaCnpjClick(Sender: TObject);
begin
  ValidarCnpj(edtCnpj.Text);
  CarregarEmpresa(edtCnpj.Text);
end;

procedure TfrmCadastroEmpresa.CarregarEmpresa(const pCnpj: string);
begin
  PassarParametro(DM.qryEmpresa, [pCnpj]);
  if DM.qryEmpresa.IsEmpty then
    ControlarBotoes(PesquisaNaoLocalizada, btnInserir, btnEditar, btnExcluir, btnGravar, btnCancelar)
  else
    ControlarBotoes(PesquisaLocaliza, btnInserir, btnEditar, btnExcluir, btnGravar, btnCancelar);
end;

procedure TfrmCadastroEmpresa.ControlarVisibilidadeCampos;
begin
  pnlCampos.Enabled := DM.qryEmpresa.State in [dsInsert, dsEdit];
end;

procedure TfrmCadastroEmpresa.FormActivate(Sender: TObject);
begin
  PassarParametro(DM.qryEmpresa, [-1]);
  ControlarBotoes(Navegando, btnInserir, btnEditar, btnExcluir, btnGravar, btnCancelar);
  ControlarVisibilidadeCampos;
end;

procedure TfrmCadastroEmpresa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PassarParametro(DM.qryEmpresa, [-1], False);
end;

procedure TfrmCadastroEmpresa.GravarDados;
begin
  try
    DM.qryEmpresacnpj.Value := edtCnpj.Text;
    DM.qryEmpresa.Post;
    PassarParametro(DM.qryEmpresa, [-1]);
    edtCnpj.Clear;
    edtCnpj.SetFocus;
    Informacao('Operação concluída com sucesso');
  except
    on E: Exception do
      if E.Message.Contains('Duplicate entry') then
      begin
        Erro('O cnpj informado já existe');
        edtCnpj.Text;
      end;
    end;
end;

procedure TfrmCadastroEmpresa.RecuperarDadosEmpresaWebService(const pCnpj: string);
begin
  if (not (DM.qryEmpresa.State = dsInsert)) then
    Exit;

  var lWebServiceEmpresa: TWebServiceEmpresa;
  lWebServiceEmpresa := TWebServiceEmpresa.Create(nil);
  try
    var lEmpresa: TEmpresa;
    if lWebServiceEmpresa.RetornaDadosEmpresa(pCnpj, lEmpresa) then
    begin
      DM.qryEmpresanome.Value := lEmpresa.Nome;
      DM.qryEmpresatipo.Value := lEmpresa.Tipo;
      DM.qryEmpresafantasia.Value := lEmpresa.Fantasia;
      DM.qryEmpresanaturezajuridica.Value := lEmpresa.NaturezaJuridica;
      DM.qryEmpresalogradouro.Value := lEmpresa.Logradouro;
      DM.qryEmpresanumero.Value := lEmpresa.Numero;
      DM.qryEmpresabairro.Value := lEmpresa.Bairro;
      DM.qryEmpresamunicipio.Value := lEmpresa.Municipio;
      DM.qryEmpresauf.Value := lEmpresa.Uf;
      DM.qryEmpresacep.Value := lEmpresa.Cep;
    end;
  finally
    lWebServiceEmpresa.Free;
  end;

end;

procedure TfrmCadastroEmpresa.ValidarCnpj(const pCnpj: string);
begin
  if pCnpj.Trim.IsEmpty then
  begin
    Alerta('Informe o cnpj');
    edtCnpj.SetFocus;
    Abort;
  end;

  if pCnpj.Trim.Length <> 14 then
  begin
    Alerta('Tamanho de cnpj incorreto');
    edtCnpj.SetFocus;
    Abort;
  end;

  if (not CnpjValido(pCnpj)) then
  begin
    Alerta('O número do cnpj informado é inválido');
    edtCnpj.SetFocus;
    Abort;
  end;
end;

end.
