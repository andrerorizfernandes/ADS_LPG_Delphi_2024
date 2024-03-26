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
    procedure FormActivate(Sender: TObject);
  private
    procedure GravarProduto;
    procedure LimparCamposDaTela;
    procedure CarregarDadosNaTela;
    function IndiceDaUnidadeNaCaixaDeSelecao(const pUnidade: string): Integer;
    { Private declarations }
  public
    FAlterando: Boolean;
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uProduto;

procedure TfrmCadProduto.btnGravarClick(Sender: TObject);
begin
  GravarProduto;
  Close;
end;

procedure TfrmCadProduto.CarregarDadosNaTela;
begin
  edtCodigo.Text := frmProduto.cdsProdutoCodigo.AsString;
  edtDescricao.Text := frmProduto.cdsProdutoNome.AsString;
  edtEan.Text := frmProduto.cdsProdutoEan.AsString;
  cboUnidade.ItemIndex := IndiceDaUnidadeNaCaixaDeSelecao(frmProduto.cdsProdutoUnidade.AsString);
  edtQuantidade.Text := frmProduto.cdsProdutoQuantidade.AsString;
  edtValor.Text := frmProduto.cdsProdutoValor.AsString;
end;

function TfrmCadProduto.IndiceDaUnidadeNaCaixaDeSelecao(
  const pUnidade: string): Integer;
begin
  Result := -1;

  var I: Integer;
  for I := 0 to cboUnidade.Items.Count - 1 do
    if (cboUnidade.Items[I] = pUnidade) then
    begin
      Result := I;
      Break;
    end;
end;

procedure TfrmCadProduto.FormActivate(Sender: TObject);
begin
  if FAlterando then
    CarregarDadosNaTela
  else
    LimparCamposDaTela;
end;

procedure TfrmCadProduto.GravarProduto;
begin
  if FAlterando then
    frmProduto.cdsProduto.Edit
  else
    frmProduto.cdsProduto.Append;

  frmProduto.cdsProdutoCodigo.AsString := edtCodigo.Text;
  frmProduto.cdsProdutoNome.Value := edtDescricao.Text;
  frmProduto.cdsProdutoEan.Value := edtEan.Text;
  frmProduto.cdsProdutoUnidade.Value := cboUnidade.Text;
  frmProduto.cdsProdutoQuantidade.Value := StrToIntDef(edtQuantidade.Text, 0);
  frmProduto.cdsProdutoValor.Value := StrToFloatDef(edtValor.Text, 0);
  frmProduto.cdsProduto.Post;
end;

procedure TfrmCadProduto.LimparCamposDaTela;
begin
  edtCodigo.Clear;
  edtDescricao.Clear;
  edtEan.Clear;
  cboUnidade.ItemIndex := -1;
  edtQuantidade.Clear;
  edtValor.Clear;
end;

end.
