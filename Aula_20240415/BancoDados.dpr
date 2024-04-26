program BancoDados;

uses
  Vcl.Forms,
  uAluno in 'uAluno.pas' {frmAluno},
  uDM in 'uDM.pas' {DM: TDataModule},
  uFuncoes in 'uFuncoes.pas',
  uCadastroAluno in 'uCadastroAluno.pas' {frmCadastroAluno},
  uPrincipal in 'uPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
