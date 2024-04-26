object frmCadastroAluno: TfrmCadastroAluno
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Aluno'
  ClientHeight = 140
  ClientWidth = 639
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 15
  object pnlDados: TPanel
    Left = 0
    Top = 0
    Width = 639
    Height = 109
    Align = alClient
    TabOrder = 0
    object lblMatricula: TLabel
      Left = 9
      Top = 8
      Width = 50
      Height = 15
      Caption = 'Matr'#237'cula'
    end
    object lblNome: TLabel
      Left = 136
      Top = 8
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object lblCurso: TLabel
      Left = 9
      Top = 58
      Width = 31
      Height = 15
      Caption = 'Curso'
    end
    object lblUsuario: TLabel
      Left = 342
      Top = 58
      Width = 40
      Height = 15
      Caption = 'Usu'#225'rio'
    end
    object dbeMatricula: TDBEdit
      Left = 9
      Top = 24
      Width = 122
      Height = 23
      DataField = 'matricula'
      DataSource = DM.dsrAluno
      TabOrder = 0
    end
    object dbeNome: TDBEdit
      Left = 136
      Top = 24
      Width = 494
      Height = 23
      DataField = 'nome'
      DataSource = DM.dsrAluno
      TabOrder = 1
    end
    object dbeCurso: TDBEdit
      Left = 9
      Top = 74
      Width = 328
      Height = 23
      DataField = 'curso'
      DataSource = DM.dsrAluno
      TabOrder = 2
    end
    object dblUsuario: TDBLookupComboBox
      Left = 342
      Top = 74
      Width = 288
      Height = 23
      DataField = 'idusuario'
      DataSource = DM.dsrAluno
      KeyField = 'id'
      ListField = 'nome'
      ListSource = DM.dsrUsuario
      TabOrder = 3
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 109
    Width = 639
    Height = 31
    Align = alBottom
    TabOrder = 1
    object btnCancelar: TBitBtn
      Left = 536
      Top = 1
      Width = 102
      Height = 29
      Align = alRight
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object btnGravar: TBitBtn
      Left = 434
      Top = 1
      Width = 102
      Height = 29
      Align = alRight
      Caption = '&Gravar'
      TabOrder = 0
      OnClick = btnGravarClick
    end
  end
end
