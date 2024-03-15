program Cliente;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uMensagem in 'uMensagem.pas' {frmMensagem},
  uExibirClientes in 'uExibirClientes.pas' {frmExibirClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
