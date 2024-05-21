unit uWebServiceEmpresa;

interface

uses
  System.SysUtils, System.Classes, REST.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TEmpresa = record
    Nome: string;
    Tipo: string;
    Fantasia: string;
    NaturezaJuridica: string;
    Logradouro: string;
    Numero: string;
    Bairro: string;
    Municipio: string;
    Uf: string;
    Cep: string;
  end;
  TWebServiceEmpresa = class(TDataModule)
    rstCliente: TRESTClient;
    rstRequisicao: TRESTRequest;
    rstResposta: TRESTResponse;
    rstAdaptadorResposta: TRESTResponseDataSetAdapter;
    mdtEmpresa: TFDMemTable;
  private
    { Private declarations }
  public
    function RetornaDadosEmpresa(const pCnpj: string; out pEmpresa: TEmpresa): Boolean;
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TWebServiceEmpresa }

function TWebServiceEmpresa.RetornaDadosEmpresa(const pCnpj: string; out pEmpresa: TEmpresa): Boolean;
const
  ENDPOINT_API = 'https://receitaws.com.br/v1/cnpj/%s';
begin
  rstCliente.BaseURL := Format(ENDPOINT_API, [pCnpj]);
  rstRequisicao.Execute;

  if (not rstResposta.StatusCode = 200) then
    Exit(False);

  pEmpresa.Nome := mdtEmpresa.FieldByName('nome').AsString;
  pEmpresa.Tipo := mdtEmpresa.FieldByName('tipo').AsString;
  pEmpresa.Fantasia := mdtEmpresa.FieldByName('fantasia').AsString;
  pEmpresa.NaturezaJuridica := mdtEmpresa.FieldByName('natureza_juridica').AsString;
  pEmpresa.Logradouro := mdtEmpresa.FieldByName('logradouro').AsString;
  pEmpresa.Numero := mdtEmpresa.FieldByName('numero').AsString;
  pEmpresa.Bairro := mdtEmpresa.FieldByName('bairro').AsString;
  pEmpresa.Municipio := mdtEmpresa.FieldByName('municipio').AsString;
  pEmpresa.Uf := mdtEmpresa.FieldByName('uf').AsString;
  pEmpresa.Cep := mdtEmpresa.FieldByName('cep').AsString;
  Result := True;
end;

end.
