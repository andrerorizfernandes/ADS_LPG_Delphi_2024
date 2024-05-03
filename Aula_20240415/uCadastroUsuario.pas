unit uCadastroUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls;

type
  TfrmCadastroUsuario = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Nome: TLabel;
    CPF: TLabel;
    identidade: TLabel;
    btnCancelar: TButton;
    btnGravar: TButton;
    dbeNome: TDBEdit;
    dbeCPF: TDBEdit;
    dbeIdentidade: TDBEdit;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbeCPFKeyPress(Sender: TObject; var Key: Char);
    procedure dbeIdentidadeKeyPress(Sender: TObject; var Key: Char);
  private
    FAlterando: Boolean;
    procedure PrepararAmbiente;
    procedure ValidarDados;
    procedure GravarDados;
    procedure Cancelar;
    { Private declarations }
  public
    property Alterando: Boolean write FAlterando;
    { Public declarations }
  end;

implementation

uses
  uDM, uFuncoes, Data.DB;

{$R *.dfm}

{ TfrmCadastroUsuario }

procedure TfrmCadastroUsuario.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TfrmCadastroUsuario.btnGravarClick(Sender: TObject);
begin
  ValidarDados;

  try
    GravarDados;
  except
    on E: Exception do
      if E.Message.Contains('Duplicate entry') then
        Erro('O cpf cadastrado já existe');
    end;
end;

procedure TfrmCadastroUsuario.Cancelar;
begin
  DM.qryUsuario.Cancel;
  Close;
end;

procedure TfrmCadastroUsuario.dbeCPFKeyPress(Sender: TObject; var Key: Char);
begin
  CaracterValido(SomenteNumeros, Key);
end;

procedure TfrmCadastroUsuario.dbeIdentidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  CaracterValido(SomenteNumeros, Key);
end;

procedure TfrmCadastroUsuario.FormActivate(Sender: TObject);
begin
  PrepararAmbiente;
end;

procedure TfrmCadastroUsuario.GravarDados;
begin
  if DM.qryUsuario.State = dsBrowse then
  begin
    Alerta('Cadastro não está em inserção ou edição');
    Exit;
  end;

  DM.qryUsuario.Post;
  DM.qryUsuario.Refresh;
  Informacao('Operação concluída com sucesso');
  Close;
end;

procedure TfrmCadastroUsuario.PrepararAmbiente;
begin
  if FAlterando then
    begin
      DM.qryUsuario.Edit;
      Caption := 'Usuário [Editando]';
    end
  else
    begin
      DM.qryUsuario.Append;
      Caption := 'Usuário [Inserindo]';
    end;

end;

procedure TfrmCadastroUsuario.ValidarDados;
begin
  if dbeNome.Text = EmptyStr then
  begin
    Alerta('Informe o nome');
    dbeNome.SetFocus;
    Abort;
  end;

  if dbeCPF.Text = EmptyStr then
  begin
    Alerta('Informe o CPF');
    dbeCPF.SetFocus;
    Abort;
  end;

  if dbeIdentidade.Text = EmptyStr then
  begin
    Alerta('Informe a Identidade');
    dbeIdentidade.SetFocus;
    Abort;
  end;

  if (not CpfValido(dbeCPF.Field.Value)) then
  begin
    Alerta('O cpf informado é inválido.');
    dbeCPF.SetFocus;
    Abort;
  end;

end;

end.
