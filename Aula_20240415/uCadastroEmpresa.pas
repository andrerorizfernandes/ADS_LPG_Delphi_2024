unit uCadastroEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Mask, Vcl.DBCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uDM;

{$R *.dfm}

procedure TfrmCadastroEmpresa.btnPesquisaCnpjClick(Sender: TObject);
begin
  DM.qryEmpresa.Close;
  DM.qryEmpresa.Params[0].Value := edtCnpj.Text;
  DM.qryEmpresa.Open;
end;

end.
