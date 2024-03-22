unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmCadProduto = class(TForm)
    pnlCampos: TPanel;
    pnlBotoes: TPanel;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    edtCodigo: TEdit;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    edtDescricao: TEdit;
    lblEan: TLabel;
    edtEan: TEdit;
    cboUnidade: TComboBox;
    edtValor: TEdit;
    edtQuantidade: TEdit;
    lblUnidade: TLabel;
    lblQuantidade: TLabel;
    lblValor: TLabel;
    procedure btnGravarClick(Sender: TObject);
  private
    procedure GravarNovoProduto;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uProduto;

procedure TfrmCadProduto.btnGravarClick(Sender: TObject);
begin
  GravarNovoProduto;
  Close;
end;

procedure TfrmCadProduto.GravarNovoProduto;
begin
  frmProduto.cdsProduto.Append;
  frmProduto.cdsProdutoCodigo.Value := StrToIntDef(edtCodigo.Text, 0);
  frmProduto.cdsProdutoNome.Value := edtDescricao.Text;
  frmProduto.cdsProdutoEan.Value := edtEan.Text;
  frmProduto.cdsProdutoUnidade.Value := cboUnidade.Text;
  frmProduto.cdsProdutoQuantidade.Value := StrToIntDef(edtQuantidade.Text, 0);
  frmProduto.cdsProdutoValor.Value := StrToFloatDef(edtValor.Text, 0);
  frmProduto.cdsProduto.Post;
end;

end.
