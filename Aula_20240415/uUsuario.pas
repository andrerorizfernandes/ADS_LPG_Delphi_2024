unit uUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmUsuario = class(TForm)
    dbgUsuario: TDBGrid;
    Panel1: TPanel;
    btnExcluir: TButton;
    btnInserir: TButton;
    btnEditar: TButton;
    pnlQuantidadeUsuario: TPanel;
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgUsuarioDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgUsuarioDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure CadastrarUsuario(const pEditar : Boolean);
    procedure AbrirEstrutura;
    procedure FecharEstrutura;
    procedure ExcluirUsuario;
    function VerificarDados(const pCodigoUsuario: integer): Boolean;
    procedure AtualizarQuantidadeRegistros;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses
  uDM, uFuncoes, uCadastroUsuario;

{$R *.dfm}


{ TfrmUsuario }

procedure TfrmUsuario.AbrirEstrutura;
begin
  DM.qryUsuario.Open;
end;

procedure TfrmUsuario.AtualizarQuantidadeRegistros;
begin
  pnlQuantidadeUsuario.Caption := IntToStr(DM.qryUsuario.RecordCount) + ' Registros ';
end;

procedure TfrmUsuario.btnEditarClick(Sender: TObject);
begin
  CadastrarUsuario(True);
end;

procedure TfrmUsuario.btnExcluirClick(Sender: TObject);
begin
  ExcluirUsuario;
  AtualizarQuantidadeRegistros;
end;

procedure TfrmUsuario.btnInserirClick(Sender: TObject);
begin
  CadastrarUsuario(False);
  AtualizarQuantidadeRegistros;
end;

procedure TfrmUsuario.CadastrarUsuario(const pEditar: Boolean);
begin
  var lCadastroUsuario: TfrmCadastroUsuario;
  lCadastroUsuario := TfrmCadastroUsuario.Create(nil);
  try
    lCadastroUsuario.Alterando := pEditar;
    lCadastroUsuario.ShowModal;
  finally
    lCadastroUsuario.Free;
  end;
end;

procedure TfrmUsuario.dbgUsuarioDblClick(Sender: TObject);
begin
  CadastrarUsuario(True);
end;

procedure TfrmUsuario.dbgUsuarioDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  begin
  ZebrarGrid(dbgUsuario, DM.qryUsuario, Rect, Column, State);
end;
end;

procedure TfrmUsuario.ExcluirUsuario;
begin
  if DM.qryUsuario.IsEmpty then
  begin
    Alerta('Não há registros há serem excluídos');
    Exit;
  end;

  if (not Pergunta('Confirma a exclusão do usuário?')) then
    Exit;

  DM.qryUsuario.Edit;
  DM.qryUsuarioexcluido.Value := 'S';
  DM.qryUsuario.Post;

  DM.qryUsuario.Refresh;
end;

procedure TfrmUsuario.FecharEstrutura;
begin
  DM.qryUsuario.Close;
end;

procedure TfrmUsuario.FormActivate(Sender: TObject);
begin
  AtualizarQuantidadeRegistros;
end;

procedure TfrmUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FecharEstrutura;
end;

procedure TfrmUsuario.FormCreate(Sender: TObject);
begin
  AbrirEstrutura;
end;

function TfrmUsuario.VerificarDados(const pCodigoUsuario: integer): Boolean;
begin
  DM.qrySQLTemporario.Close;
  try
    DM.qrySQLTemporario.SQL.Add('SELECT id FROM aluno WHERE idusuario =:idusuario');
    DM.qrySQLTemporario.Params[0].Value := pCodigoUsuario;
    DM.qrySQLTemporario.Open;

    Result := (not DM.qrySQLTemporario.IsEmpty);
  finally
    DM.qrySQLTemporario.SQL.Clear;
    DM.qrySQLTemporario.Close;
  end;

end;

end.
