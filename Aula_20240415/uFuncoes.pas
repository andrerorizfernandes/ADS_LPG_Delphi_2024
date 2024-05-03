unit uFuncoes;

interface

uses
  System.Types, Vcl.DBGrids, Vcl.Grids;

const
  NOMESISTEMA = 'Banco de dados';
  SomenteNumeros = 1;
  SomenteCaracteres = 2;
  SomenteLetras = 3;
  SomenteNumerosLetras = 4;
  SomenteNumerosVirgula = 5;

  procedure Alerta(Mensagem: string);
  procedure Informacao(Mensagem: string);
  procedure Erro(Mensagem : string);
  procedure ZebrarGrid(Sender, DataSet: TObject; Rect: TRect; Column: TColumn;State: TGridDrawState);
  function Pergunta(Pergunta: string): Boolean;
  procedure CaracterValido(Tipo : integer; var key : Char);
  function CpfValido(numero : string) : boolean;

implementation

uses
  Vcl.Forms, Winapi.Windows, FireDAC.Comp.Client, Vcl.Graphics,
  System.SysUtils;

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

procedure CaracterValido(Tipo : integer; var key : Char);
var
 Caracteres: TSysCharSet;
begin
  case Tipo of
    1 : Caracteres:= ['0'..'9', #3, #8, #13, #22, #24, #27, #42];             //Somente Números
    2 : Caracteres:= ['0'..'9'];                   //Letras e caracteres
    3 : Caracteres:= ['a'..'z','A'..'Z'];          //somente letras
    4 : Caracteres:= ['a'..'z','A'..'Z','0'..'9', #3, #8, #13, #22, #24, #27]; //Letras e números
    5 : Caracteres:= ['0'..'9',',',#8];               //Somente Números e Virgula
  end;

  if ((Tipo = 2) and CharInSet(key,Caracteres)) or
     ((Tipo <> 2) and not CharInSet(key,Caracteres)) then
  begin
    //beep;
    key:= #0;
  end;
end;

Function CpfValido(numero : string) : boolean;
var
  i               : integer;
  Want            : char;
  Wvalid          : boolean;
  Wdigit1,Wdigit2 : integer;
begin
  if numero.IsEmpty then
    Exit(False);

  if numero.Length <> 11 then
    Exit(False);

  Wvalid:= False;
  Wdigit1:= 0;
  Wdigit2:= 0;
  Want:= numero[1];//variavel para testar se o cpf é repetido como 111.111.111-11
  Delete(numero,ansipos('.',numero),1); //retira as mascaras se houver
  Delete(numero,ansipos('.',numero),1);
  Delete(numero,ansipos('-',numero),1);

  //testar se o cpf é repetido como 111.111.111-11
  for i:=1 to length(numero) do
  begin
    if numero[i] <> Want then
    begin
      Wvalid:=true; // se o cpf possui um digito diferente ele passou no primeiro teste
      break;
    end;
  end;
  // se o cpf é composto por numeros repetido retorna falso
  if not Wvalid then
  begin
    result:=false;
    exit;
  end;

  //executa o calculo para o primeiro verificador
  for i:=1 to 9 do
  begin
    wdigit1:=Wdigit1+(strtoint(numero[10-i])*(I+1));
  end;
  Wdigit1:= ((11 - (Wdigit1 mod 11))mod 11) mod 10;
  {formula do primeiro verificador
  soma=1°*2+2°*3+3°*4.. até 9°*10
  digito1 = 11 - soma mod 11
  se digito > 10 digito1 =0}

  //verifica se o 1° digito confere
  if IntToStr(Wdigit1) <> numero[10] then
  begin
    result:=false;
    exit;
  end;

  for i:=1 to 10 do
  begin
    wdigit2:=Wdigit2+(strtoint(numero[11-i])*(I+1));
  end;
  Wdigit2:= ((11 - (Wdigit2 mod 11))mod 11) mod 10;
  {formula do segundo verificador
  soma=1°*2+2°*3+3°*4.. até 10°*11
  digito1 = 11 - soma mod 11
  se digito > 10 digito1 =0}

  // confere o 2° digito verificador
  if IntToStr(Wdigit2) <> numero[11] then
  begin
    result:=false;
    exit;
  end;

  //se chegar até aqui o cpf é valido
  result:=true;
end;

end.
