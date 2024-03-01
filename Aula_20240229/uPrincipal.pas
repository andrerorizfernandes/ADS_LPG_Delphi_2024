unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    pnlPrincipal: TPanel;
    pnlBotoes: TPanel;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    lblNome: TLabel;
    edtNome: TEdit;
    lblIdade: TLabel;
    edtIdade: TEdit;
    lblCpf: TLabel;
    edtCpf: TEdit;
    edtIdentidade: TEdit;
    lblIdentidade: TLabel;
    lblSexo: TLabel;
    cboSexo: TComboBox;
    lblEstadoCivil: TLabel;
    cboEstadoCivil: TComboBox;
    lblObservacoes: TLabel;
    memObservacoes: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

end.
