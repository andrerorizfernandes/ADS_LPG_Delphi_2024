unit uFuncoes;

interface

uses
  System.Types, Vcl.DBGrids, Vcl.Grids, Vcl.StdCtrls, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.Forms, Vcl.Buttons;

type
  TOperacaoDeTela = (Navegando, Inserindo, Editando, Excluindo, PesquisaLocaliza, PesquisaNaoLocalizada);

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
  procedure AtualizarQuantidade(pPainel: TPanel; pQuery: TFDQuery);
  procedure PovoarCampos(pCampo: TComboBox; pQuery: TFDQuery);
  procedure PovoarOperacoes(pOperacao: TComboBox);
  procedure FiltrarDados(pCampo, pOperacao: TComboBox; pQuery: TFDQuery; pValor: string);
  procedure PassarParametro(DataSet: TFDQuery; Valores: array of variant; AbrirCDS : Boolean=True);
  function CnpjValido(pCnpj: string): Boolean;
  procedure ControlarBotoes(const pOperacaoDeTela: TOperacaoDeTela; const pBotaoInserir,
    pBotaoEditar, pBotaoExcluir, pBotaoGravar, pBotaoCancelar: TBitBtn);

implementation

uses
  Winapi.Windows, Vcl.Graphics,
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

procedure AtualizarQuantidade(pPainel: TPanel; pQuery: TFDQuery);
begin
  const MENSAGEM = '%d Registros ';
  pPainel.Caption := Format(MENSAGEM, [pQuery.RecordCount]);
end;

procedure PovoarCampos(pCampo: TComboBox; pQuery: TFDQuery);
begin
  pCampo.Items.Clear;
  var I: integer;
  for I := 0 to pQuery.Fields.Count - 1 do
    if pQuery.Fields[I].Visible then
      pCampo.Items.Add(pQuery.Fields[I].FieldName);
end;

procedure PovoarOperacoes(pOperacao: TComboBox);
begin
  pOperacao.Items.Clear;
  pOperacao.Items.Add('Igual');
  pOperacao.Items.Add('Diferente');
  pOperacao.Items.Add('Iniciado por');
  pOperacao.Items.Add('Finalizado por');
  pOperacao.Items.Add('Que contenha');
end;

procedure FiltrarDados(pCampo, pOperacao: TComboBox; pQuery: TFDQuery; pValor: string);
begin
  if pCampo.ItemIndex = -1 then
  begin
    Alerta('Selecione o campo');
    pCampo.SetFocus;
    Abort;
  end;

  if pOperacao.ItemIndex = -1 then
  begin
    Alerta('Selecione a operação');
    pOperacao.SetFocus;
    Abort;
  end;

  var lFiltro: string;
  lFiltro := EmptyStr;
  case pOperacao.ItemIndex of
    0: lFiltro := pCampo.Text + '=' + QuotedStr(pValor);
    1: lFiltro := pCampo.Text + '<>' + QuotedStr(pValor);
    2: lFiltro := pCampo.Text + ' like ' + QuotedStr(pValor + '%');
    3: lFiltro := pCampo.Text + ' like ' + QuotedStr('%' + pValor);
    4: lFiltro := pCampo.Text + ' like ' + QuotedStr('%' + pValor + '%');
  end;
  pQuery.Filter := lFiltro;
  pQuery.Filtered := False;
  if (Trim(pValor) <> EmptyStr) then
    pQuery.Filtered := True;
end;

procedure PassarParametro(DataSet : TFDQuery; Valores : array of variant; AbrirCDS: Boolean=True);
var
  i : integer;
begin
  DataSet.Close;
  for i := 0 to Pred(length(Valores)) do
    DataSet.Params[i].Value:= Valores[i];

  if AbrirCDS then
  begin
    try
      DataSet.Open;
    except
      Alerta('Valor inválido!');
    end;
  end;
end;

function CnpjValido(pCnpj: string): Boolean;
var   dig13, dig14: string;
    sm, i, r, peso: integer;
begin
// length - retorna o tamanho da string do CNPJ (CNPJ é um número formado por 14 dígitos)
  if ((pCnpj = '00000000000000') or (pCnpj = '11111111111111') or
  (pCnpj = '22222222222222') or (pCnpj = '33333333333333') or
  (pCnpj = '44444444444444') or (pCnpj = '55555555555555') or
  (pCnpj = '66666666666666') or (pCnpj = '77777777777777') or
  (pCnpj = '88888888888888') or (pCnpj = '99999999999999') or
  (length(pCnpj) <> 14)) then
  begin
    Result := false;
    exit;
  end;

// "try" - protege o código para eventuais erros de conversão de tipo através da função "StrToInt"
  try
{ *-- Cálculo do 1o. Digito Verificador --* }
     sm:= 0;
     peso:= 2;
     for i := 12 downto 1 do
    begin
      //StrToInt converte o i-ésimo caractere do CNPJ em um número
      sm:= sm + (StrToInt(pCnpj[i]) * peso);
      peso:= peso + 1;
      if (peso = 10) then peso := 2;
    end;
    r:= sm mod 11;
    if ((r = 0) or (r = 1))
       then dig13 := '0'
    else str((11-r):1, dig13); // converte um número no respectivo caractere numérico

{ *-- Cálculo do 2o. Digito Verificador --* }
    sm:= 0;
    peso:= 2;
    for i := 13 downto 1 do
    begin
      sm:= sm + (StrToInt(pCnpj[i]) * peso);
      peso:= peso + 1;
      if (peso = 10) then peso:= 2;
    end;
    r:= sm mod 11;
    if ((r = 0) or (r = 1)) then dig14:= '0' else str((11-r):1, dig14);

{ Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig13 = pCnpj[13]) and (dig14 = pCnpj[14]))then
      Result := true
    else
      Result := false;
  except
    Result := false
  end;
end;

procedure ControlarBotoes(const pOperacaoDeTela: TOperacaoDeTela; const pBotaoInserir,
  pBotaoEditar, pBotaoExcluir, pBotaoGravar, pBotaoCancelar: TBitBtn);
begin
  case pOperacaoDeTela of
    Navegando:
    begin
      pBotaoInserir.Enabled := True;
      pBotaoEditar.Enabled := False;
      pBotaoExcluir.Enabled := False;
      pBotaoGravar.Enabled := False;
      pBotaoCancelar.Enabled := False;
    end;
    Inserindo:
    begin
      pBotaoInserir.Enabled := False;
      pBotaoEditar.Enabled := False;
      pBotaoExcluir.Enabled := False;
      pBotaoGravar.Enabled := True;
      pBotaoCancelar.Enabled := True;
    end;
    Editando:
    begin
      pBotaoInserir.Enabled := False;
      pBotaoEditar.Enabled := False;
      pBotaoExcluir.Enabled := False;
      pBotaoGravar.Enabled := True;
      pBotaoCancelar.Enabled := True;
    end;
    PesquisaLocaliza:
    begin
      pBotaoInserir.Enabled := False;
      pBotaoEditar.Enabled := True;
      pBotaoExcluir.Enabled := True;
      pBotaoGravar.Enabled := False;
      pBotaoCancelar.Enabled := True;
    end;
    PesquisaNaoLocalizada:
    begin
      pBotaoInserir.Enabled := False;
      pBotaoEditar.Enabled := False;
      pBotaoExcluir.Enabled := False;
      pBotaoGravar.Enabled := False;
      pBotaoCancelar.Enabled := False;
    end;
  end;
end;

end.
