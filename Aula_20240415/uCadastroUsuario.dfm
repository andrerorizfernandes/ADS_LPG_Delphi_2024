object frmCadastroUsuario: TfrmCadastroUsuario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmCadastroUsuario'
  ClientHeight = 137
  ClientWidth = 428
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
    Width = 428
    Height = 106
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 889
    ExplicitHeight = 58
    object Nome: TLabel
      Left = 9
      Top = 8
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object CPF: TLabel
      Left = 9
      Top = 56
      Width = 21
      Height = 15
      Caption = 'CPF'
    end
    object identidade: TLabel
      Left = 185
      Top = 56
      Width = 56
      Height = 15
      Caption = 'Identidade'
    end
    object dbeNome: TDBEdit
      Left = 9
      Top = 24
      Width = 408
      Height = 23
      DataField = 'nome'
      DataSource = DM.dsrUsuario
      TabOrder = 0
    end
    object dbeCPF: TDBEdit
      Left = 9
      Top = 72
      Width = 170
      Height = 23
      DataField = 'cpf'
      DataSource = DM.dsrUsuario
      MaxLength = 11
      TabOrder = 1
      OnKeyPress = dbeCPFKeyPress
    end
    object dbeIdentidade: TDBEdit
      Left = 185
      Top = 72
      Width = 232
      Height = 23
      DataField = 'identidade'
      DataSource = DM.dsrUsuario
      TabOrder = 2
      OnKeyPress = dbeIdentidadeKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 106
    Width = 428
    Height = 31
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 58
    ExplicitWidth = 889
    object btnCancelar: TButton
      Left = 325
      Top = 1
      Width = 102
      Height = 29
      Align = alRight
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = btnCancelarClick
      ExplicitLeft = 786
    end
    object btnGravar: TButton
      Left = 223
      Top = 1
      Width = 102
      Height = 29
      Align = alRight
      Caption = 'Gravar'
      TabOrder = 1
      OnClick = btnGravarClick
      ExplicitLeft = 684
    end
  end
end
