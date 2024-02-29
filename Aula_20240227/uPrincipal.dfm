object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Primeira aula'
  ClientHeight = 94
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object lblUsuario: TLabel
    Left = 6
    Top = 8
    Width = 107
    Height = 15
    Caption = 'Informe o seu nome'
  end
  object edtUsuario: TEdit
    Left = 8
    Top = 24
    Width = 385
    Height = 23
    Hint = 'Informe o seu nome'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnKeyPress = edtUsuarioKeyPress
  end
  object btnLogin: TButton
    Left = 8
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Login'
    TabOrder = 1
    OnClick = btnLoginClick
  end
end
