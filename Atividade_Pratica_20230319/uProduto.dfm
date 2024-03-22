object frmProduto: TfrmProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Produto'
  ClientHeight = 390
  ClientWidth = 703
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
  object dbgProduto: TDBGrid
    Left = 0
    Top = 0
    Width = 703
    Height = 359
    Align = alClient
    DataSource = dsrProduto
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 266
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ean'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unidade'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Visible = True
      end>
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 359
    Width = 703
    Height = 31
    Align = alBottom
    TabOrder = 1
    object btnExcluir: TBitBtn
      Left = 608
      Top = 1
      Width = 94
      Height = 29
      Align = alRight
      Caption = '&Excluir'
      TabOrder = 0
      OnClick = btnExcluirClick
    end
    object btnInserir: TBitBtn
      Left = 420
      Top = 1
      Width = 94
      Height = 29
      Align = alRight
      Caption = '&Inserir'
      TabOrder = 1
      OnClick = btnInserirClick
    end
    object btnEditar: TBitBtn
      Left = 514
      Top = 1
      Width = 94
      Height = 29
      Align = alRight
      Caption = '&Editar'
      TabOrder = 2
      OnClick = btnEditarClick
    end
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 200
    object cdsProdutoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsProdutoNome: TStringField
      FieldName = 'Nome'
      Size = 60
    end
    object cdsProdutoEan: TStringField
      FieldName = 'Ean'
      Size = 13
    end
    object cdsProdutoUnidade: TStringField
      FieldName = 'Unidade'
      Size = 2
    end
    object cdsProdutoQuantidade: TIntegerField
      FieldName = 'Quantidade'
    end
    object cdsProdutoValor: TFloatField
      FieldName = 'Valor'
    end
  end
  object dsrProduto: TDataSource
    DataSet = cdsProduto
    Left = 432
    Top = 200
  end
end
