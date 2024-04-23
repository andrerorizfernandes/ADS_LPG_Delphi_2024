unit uFuncoes;

interface

uses
  System.Types, Vcl.DBGrids, Vcl.Grids;

const
  NOMESISTEMA = 'Banco de dados';

  procedure Alerta(Mensagem: string);
  procedure Informacao(Mensagem: string);
  procedure Erro(Mensagem : string);
  procedure ZebrarGrid(Sender, DataSet: TObject; Rect: TRect; Column: TColumn;State: TGridDrawState);
  function Pergunta(Pergunta: string): Boolean;

implementation

uses
  Vcl.Forms, Winapi.Windows, FireDAC.Comp.Client, Vcl.Graphics;

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

procedure ZebrarGrid(Sender, DataSet: TObject; Rect: TRect; Column: TColumn;
  State: TGridDrawState);
begin
  if not (DataSet as TFDQuery).Active  then Exit;
  if     (DataSet as TFDQuery).IsEmpty then Exit;

  if not Odd((DataSet as TFDQuery).RecNo) then
    if not (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.Color := cl3DLight;
      (Sender as TDBGrid).Canvas.FillRect(Rect);//pinta a célula
      (Sender as TDBGrid).DefaultDrawDataCell(rect,column.Field,State);
    end
    else
    begin
      (Sender as TDBGrid).Canvas.Brush.Color := $00CFB78F;
      (Sender as TDBGrid).Canvas.FillRect(Rect);//pinta a célula
      (Sender as TDBGrid).DefaultDrawDataCell(rect,column.Field,State);
    end
    else
    if (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.Color := $00CFB78F;
      (Sender as TDBGrid).Canvas.FillRect(Rect);//pinta a célula
      (Sender as TDBGrid).DefaultDrawDataCell(rect,column.Field,State);
    end;
end;

end.
