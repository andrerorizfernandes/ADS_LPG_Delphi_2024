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
    procedure AbrirCadastroDeProduto(const pAlterando: Boolean);
    procedure ExcluirProduto;
    procedure AbrirEstrutura;
    procedure FecharEstrutura;
    procedure ValidarDados;
    procedure GravarCenario;
    procedure RecuperarCenario;
    function DiretorioCompletoDoArquivoXml: string;
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

procedure TfrmProduto.AbrirCadastroDeProduto(const pAlterando: Boolean);
begin
  var lTelaCadastroProduto: TfrmCadProduto;
  lTelaCadastroProduto := TfrmCadProduto.Create(nil);
  try
    lTelaCadastroProduto.FAlterando := pAlterando;
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
  ValidarDados;
  AbrirCadastroDeProduto(True);
end;

procedure TfrmProduto.btnExcluirClick(Sender: TObject);
begin
  ValidarDados;
  ExcluirProduto;
end;

procedure TfrmProduto.btnInserirClick(Sender: TObject);
begin
  AbrirCadastroDeProduto(False);
end;

function TfrmProduto.DiretorioCompletoDoArquivoXml: string;
begin
  Result := ExtractFilePath(ParamStr(0)) + 'CadastroProdutos.xml';
end;

procedure TfrmProduto.ExcluirProduto;
begin
  cdsProduto.Delete;
end;

procedure TfrmProduto.FecharEstrutura;
begin
  cdsProduto.Close;
end;

procedure TfrmProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravarCenario;
  FecharEstrutura;
end;

procedure TfrmProduto.FormCreate(Sender: TObject);
begin
  AbrirEstrutura;
  RecuperarCenario;
end;

procedure TfrmProduto.GravarCenario;
begin
  if (not frmProduto.cdsProduto.IsEmpty) then
    frmProduto.cdsProduto.SaveToFile(DiretorioCompletoDoArquivoXml, dfXMLUTF8);
end;

procedure TfrmProduto.RecuperarCenario;
begin
  if FileExists(DiretorioCompletoDoArquivoXml) then
    frmProduto.cdsProduto.LoadFromFile(DiretorioCompletoDoArquivoXml);
end;

procedure TfrmProduto.ValidarDados;
begin
  if (cdsProduto.IsEmpty) then
  begin
    ShowMessage('Sem produtos cadastrados');
    Abort;
  end;
end;

end.
