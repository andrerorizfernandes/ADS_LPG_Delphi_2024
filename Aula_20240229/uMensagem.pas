unit uMensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMensagem = class(TForm)
    memMensagem: TMemo;
  private
    { Private declarations }
  public
    procedure ExibirMensagem(const pMensagem: TStringList);
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfrmMensagem }

procedure TfrmMensagem.ExibirMensagem(const pMensagem: TStringList);
begin
  memMensagem.Lines := pMensagem;
  ShowModal;
end;

end.
