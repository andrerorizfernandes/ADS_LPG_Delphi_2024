program CadProduto;

uses
  Vcl.Forms,
  uProduto in 'uProduto.pas' {frmProduto},
  uCadProduto in 'uCadProduto.pas' {frmCadProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmProduto, frmProduto);
  Application.Run;
end.
