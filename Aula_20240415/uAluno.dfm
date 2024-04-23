object frmAluno: TfrmAluno
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Aluno'
  ClientHeight = 415
  ClientWidth = 916
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object dbgAluno: TDBGrid
    Left = 0
    Top = 0
    Width = 916
    Height = 385
    Align = alClient
    DataSource = DM.dsrAluno
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = dbgAlunoDrawColumnCell
    OnDblClick = dbgAlunoDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'matricula'
        Title.Caption = 'Matr'#237'cula'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 258
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'curso'
        Title.Caption = 'Curso'
        Width = 216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuario'
        Title.Caption = 'Usu'#225'rio'
        Width = 265
        Visible = True
      end>
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 385
    Width = 916
    Height = 30
    Align = alBottom
    TabOrder = 1
    object btnExcluir: TBitBtn
      Left = 808
      Top = 1
      Width = 107
      Height = 28
      Align = alRight
      Caption = 'E&xcluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnInserir: TBitBtn
      Left = 594
      Top = 1
      Width = 107
      Height = 28
      Align = alRight
      Caption = '&Inserir'
      TabOrder = 0
      OnClick = btnInserirClick
    end
    object btnEditar: TBitBtn
      Left = 701
      Top = 1
      Width = 107
      Height = 28
      Align = alRight
      Caption = '&Editar'
      TabOrder = 1
      OnClick = btnEditarClick
    end
  end
end
