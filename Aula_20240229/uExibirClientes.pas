unit uExibirClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient;

type
  TfrmExibirClientes = class(TForm)
    dbgCliente: TDBGrid;
    cdsCliente: TClientDataSet;
    dsrCliente: TDataSource;
    cdsClienteNome: TStringField;
    cdsClienteIdade: TStringField;
    cdsClienteCpf: TStringField;
    cdsClienteIdentidade: TStringField;
    cdsClienteSexo: TStringField;
    cdsClienteEstadoCivil: TStringField;
    cdsClienteObservacoes: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    procedure AbrirEstrutura;
    procedure FecharEstrutura;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExibirClientes: TfrmExibirClientes;

implementation

{$R *.dfm}

{ TfrmExibirClientes }

procedure TfrmExibirClientes.AbrirEstrutura;
begin
  if (not cdsCliente.Active) then
  begin
    cdsCliente.CreateDataSet;
    cdsCliente.Open;
  end;
end;

procedure TfrmExibirClientes.FecharEstrutura;
begin
  cdsCliente.Close;
end;

procedure TfrmExibirClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FecharEstrutura;
end;

procedure TfrmExibirClientes.FormCreate(Sender: TObject);
begin
  AbrirEstrutura;
end;

end.
