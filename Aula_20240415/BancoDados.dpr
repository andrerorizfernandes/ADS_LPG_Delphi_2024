program BancoDados;

uses
  Vcl.Forms,
  uAluno in 'uAluno.pas' {frmAluno},
  uDM in 'uDM.pas' {DM: TDataModule},
  uFuncoes in 'uFuncoes.pas',
  uCadastroAluno in 'uCadastroAluno.pas' {frmCadastroAluno},
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uUsuario in 'uUsuario.pas' {frmUsuario},
  uCadastroUsuario in 'uCadastroUsuario.pas' {frmCadastroUsuario},
  uCadastroEmpresa in 'uCadastroEmpresa.pas' {frmCadastroEmpresa},
  uWebServiceEmpresa in 'uWebServiceEmpresa.pas' {WebServiceEmpresa: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
