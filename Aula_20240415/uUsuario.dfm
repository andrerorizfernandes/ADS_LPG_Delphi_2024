object frmUsuario: TfrmUsuario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Usu'#225'rio'
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
  object dbgUsuario: TDBGrid
    Left = 0
    Top = 0
    Width = 916
    Height = 385
    Align = alClient
    DataSource = DM.dsrUsuario
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = dbgUsuarioDrawColumnCell
    OnDblClick = dbgUsuarioDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 553
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cpf'
        Title.Caption = 'Cpf'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'identidade'
        Title.Caption = 'Identidade'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 155
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 385
    Width = 916
    Height = 30
    Align = alBottom
    TabOrder = 1
    object btnExcluir: TButton
      Left = 808
      Top = 1
      Width = 107
      Height = 28
      Align = alRight
      Caption = 'E&xcluir'
      TabOrder = 0
      OnClick = btnExcluirClick
      ExplicitLeft = 840
    end
    object btnInserir: TButton
      Left = 594
      Top = 1
      Width = 107
      Height = 28
      Align = alRight
      Caption = '&Inserir'
      TabOrder = 1
      OnClick = btnInserirClick
      ExplicitLeft = 690
    end
    object btnEditar: TButton
      Left = 701
      Top = 1
      Width = 107
      Height = 28
      Align = alRight
      Caption = '&Editar'
      TabOrder = 2
      OnClick = btnEditarClick
      ExplicitLeft = 765
    end
  end
end
