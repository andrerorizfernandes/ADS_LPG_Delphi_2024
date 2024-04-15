unit uAluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmAluno = class(TForm)
    dbgAluno: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure AbrirEstrutura;
    procedure FecharEstrutura;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAluno: TfrmAluno;

implementation

{$R *.dfm}

uses uDM;

{ TfrmAluno }

procedure TfrmAluno.AbrirEstrutura;
begin
  DM.qryAluno.Open;
end;

procedure TfrmAluno.FecharEstrutura;
begin
  DM.qryAluno.Close;
end;

procedure TfrmAluno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FecharEstrutura;
end;

procedure TfrmAluno.FormCreate(Sender: TObject);
begin
  AbrirEstrutura;
end;

end.
