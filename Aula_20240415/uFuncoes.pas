unit uFuncoes;

interface

const
  NOMESISTEMA = 'Banco de dados';

  procedure Alerta(Mensagem: string);
  procedure Informacao(Mensagem: string);
  procedure Erro(Mensagem : string);
  function Pergunta(Pergunta: string): Boolean;

implementation

uses
  Vcl.Forms, Winapi.Windows;

procedure Alerta(Mensagem: string);
begin
  Application.MessageBox(PChar(Mensagem), PWideChar(NOMESISTEMA), MB_ICONWARNING);
end;

Procedure Informacao(Mensagem: string);
begin
  Application.MessageBox(PChar(Mensagem), PWideChar(NOMESISTEMA), MB_ICONINFORMATION);
end;

procedure Erro(Mensagem : string);
begin
  Application.MessageBox(Pchar(Mensagem), PWideChar(NOMESISTEMA), MB_OK + MB_ICONERROR);
end;

function Pergunta(Pergunta: string): Boolean;
begin
  if Application.MessageBox(PChar(Pergunta), PWideChar(NOMESISTEMA), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = idYes then
    Result := True
  else
    Result := False;
end;

end.
