unit uProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

type
  TfrmProduto = class(TForm)
    dbgProduto: TDBGrid;
    pnlBotoes: TPanel;
    btnExcluir: TBitBtn;
    btnInserir: TBitBtn;
    btnEditar: TBitBtn;
    cdsProduto: TClientDataSet;
    dsrProduto: TDataSource;
    cdsProdutoCodigo: TIntegerField;
    cdsProdutoNome: TStringField;
    cdsProdutoEan: TStringField;
    cdsProdutoUnidade: TStringField;
    cdsProdutoQuantidade: TIntegerField;
    cdsProdutoValor: TFloatField;
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
  private
    procedure InserirProduto;
    procedure ExcluirProduto;
    procedure AbrirEstrutura;
    procedure FecharEstrutura;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProduto: TfrmProduto;

implementation

uses
  uCadProduto;

{$R *.dfm}

{ TfrmProduto }

procedure TfrmProduto.InserirProduto;
begin
  var lTelaCadastroProduto: TfrmCadProduto;
  lTelaCadastroProduto := TfrmCadProduto.Create(nil);
  try
    lTelaCadastroProduto.ShowModal;
  finally
    lTelaCadastroProduto.Free;
  end;
end;

procedure TfrmProduto.AbrirEstrutura;
begin
  if (not cdsProduto.Active) then
  begin
    cdsProduto.CreateDataSet;
    cdsProduto.Open;
  end;
end;

procedure TfrmProduto.btnEditarClick(Sender: TObject);
begin
  InserirProduto;
end;

procedure TfrmProduto.btnExcluirClick(Sender: TObject);
begin
  ExcluirProduto;
end;

procedure TfrmProduto.btnInserirClick(Sender: TObject);
begin
  InserirProduto;
end;

procedure TfrmProduto.ExcluirProduto;
begin
  if (not cdsProduto.IsEmpty) then
    cdsProduto.Delete;
end;

procedure TfrmProduto.FecharEstrutura;
begin
  cdsProduto.Close;
end;

procedure TfrmProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FecharEstrutura;
end;

procedure TfrmProduto.FormCreate(Sender: TObject);
begin
  AbrirEstrutura;
end;

end.
