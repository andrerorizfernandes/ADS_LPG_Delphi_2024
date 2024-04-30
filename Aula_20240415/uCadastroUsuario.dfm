object frmCadastroUsuario: TfrmCadastroUsuario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmCadastroUsuario'
  ClientHeight = 89
  ClientWidth = 889
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 889
    Height = 58
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 40
    ExplicitTop = 72
    ExplicitWidth = 916
    ExplicitHeight = 385
    object Nome: TLabel
      Left = 9
      Top = 8
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object CPF: TLabel
      Left = 471
      Top = 8
      Width = 21
      Height = 15
      Caption = 'CPF'
    end
    object identidade: TLabel
      Left = 647
      Top = 8
      Width = 56
      Height = 15
      Caption = 'Identidade'
    end
    object dbeNome: TDBEdit
      Left = 9
      Top = 24
      Width = 456
      Height = 23
      DataField = 'nome'
      DataSource = DM.dsrUsuario
      TabOrder = 0
    end
    object dbeCPF: TDBEdit
      Left = 471
      Top = 24
      Width = 170
      Height = 23
      DataField = 'cpf'
      DataSource = DM.dsrUsuario
      TabOrder = 1
    end
    object dbeIdentidade: TDBEdit
      Left = 647
      Top = 24
      Width = 232
      Height = 23
      DataField = 'identidade'
      DataSource = DM.dsrUsuario
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 58
    Width = 889
    Height = 31
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 170
    ExplicitWidth = 900
    object btnCancelar: TButton
      Left = 786
      Top = 1
      Width = 102
      Height = 29
      Align = alRight
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = btnCancelarClick
      ExplicitLeft = 824
    end
    object btnGravar: TButton
      Left = 684
      Top = 1
      Width = 102
      Height = 29
      Align = alRight
      Caption = 'Gravar'
      TabOrder = 1
      OnClick = btnGravarClick
      ExplicitLeft = 749
    end
  end
end
