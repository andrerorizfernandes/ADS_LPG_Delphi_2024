unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Menus,
  Vcl.Imaging.jpeg;

type
  TfrmPrincipal = class(TForm)
    mmPrincipal: TMainMenu;
    Cadastro1: TMenuItem;
    Aluno1: TMenuItem;
    Usurio1: TMenuItem;
    stbRodape: TStatusBar;
    imgPrincipal: TImage;
    tmrPrincipal: TTimer;
    procedure tmrPrincipalTimer(Sender: TObject);
    procedure Aluno1Click(Sender: TObject);
    procedure Usurio1Click(Sender: TObject);
  private
    procedure PreencherRodape;
    procedure ExibirAluno;
    procedure ExibirUsuario;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uAluno, uUsuario;

{ TfrmPrincipal }

procedure TfrmPrincipal.Aluno1Click(Sender: TObject);
begin
  ExibirAluno;
end;

procedure TfrmPrincipal.ExibirAluno;
begin
  var lAluno: TfrmAluno;
  lAluno := TfrmAluno.Create(nil);
  try
    lAluno.ShowModal;
  finally
    lAluno.Free;
  end;
end;

procedure TfrmPrincipal.ExibirUsuario;
begin
  var lUsuario: TfrmUsuario;
  lUsuario := TfrmUsuario.Create(nil);
  try
    lUsuario.ShowModal;
  finally
    lUsuario.Free;
  end;
end;

procedure TfrmPrincipal.PreencherRodape;
begin
  stbRodape.Panels[0].Text := DateToStr(Date);
  stbRodape.Panels[1].Text := TimeToStr(Time);
  stbRodape.Panels[2].Text := 'Sistema modelo de conexão com o SGBD MySQL';
end;

procedure TfrmPrincipal.tmrPrincipalTimer(Sender: TObject);
begin
  PreencherRodape;
end;

procedure TfrmPrincipal.Usurio1Click(Sender: TObject);
begin
  ExibirUsuario;
end;

end.
