unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    Conexao: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    qryAluno: TFDQuery;
    dsrAluno: TDataSource;
    qryAlunoid: TFDAutoIncField;
    qryAlunomatricula: TStringField;
    qryAlunonome: TStringField;
    qryAlunocurso: TStringField;
    qryAlunoidusuario: TIntegerField;
    qryAlunousuario: TStringField;
    qryUsuario: TFDQuery;
    dsrUsuario: TDataSource;
    qryUsuarioid: TFDAutoIncField;
    qryUsuarioclientes: TStringField;
    qryUsuariocpf: TStringField;
    qryUsuarioidentidade: TStringField;
    qrySQLTemporario: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
