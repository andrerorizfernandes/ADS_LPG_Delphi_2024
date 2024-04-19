program BancoDados;

uses
  Vcl.Forms,
  uAluno in 'uAluno.pas' {frmAluno},
  uDM in 'uDM.pas' {DM: TDataModule},
  uFuncoes in 'uFuncoes.pas',
  uCadastroAluno in 'uCadastroAluno.pas' {frmCadastroAluno};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmAluno, frmAluno);
  Application.Run;
end.
