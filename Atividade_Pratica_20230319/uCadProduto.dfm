object frmCadProduto: TfrmCadProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Produto'
  ClientHeight = 129
  ClientWidth = 498
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlCampos: TPanel
    Left = 0
    Top = 0
    Width = 498
    Height = 99
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 1
    ExplicitWidth = 623
    ExplicitHeight = 208
    object lblCodigo: TLabel
      Left = 8
      Top = 5
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object lblDescricao: TLabel
      Left = 79
      Top = 5
      Width = 51
      Height = 15
      Caption = 'Descri'#231#227'o'
    end
    object lblEan: TLabel
      Left = 8
      Top = 50
      Width = 23
      Height = 15
      Caption = 'EAN'
    end
    object lblUnidade: TLabel
      Left = 183
      Top = 50
      Width = 44
      Height = 15
      Caption = 'Unidade'
    end
    object lblQuantidade: TLabel
      Left = 287
      Top = 50
      Width = 62
      Height = 15
      Caption = 'Quantidade'
    end
    object lblValor: TLabel
      Left = 390
      Top = 50
      Width = 26
      Height = 15
      Caption = 'Valor'
    end
    object edtCodigo: TEdit
      Left = 8
      Top = 21
      Width = 65
      Height = 23
      NumbersOnly = True
      TabOrder = 0
    end
    object edtDescricao: TEdit
      Left = 79
      Top = 21
      Width = 408
      Height = 23
      TabOrder = 1
    end
    object edtEan: TEdit
      Left = 8
      Top = 66
      Width = 169
      Height = 23
      NumbersOnly = True
      TabOrder = 2
    end
    object cboUnidade: TComboBox
      Left = 183
      Top = 66
      Width = 98
      Height = 23
      Style = csDropDownList
      TabOrder = 3
      Items.Strings = (
        'UN'
        'KG'
        'LT'
        'PC')
    end
    object edtValor: TEdit
      Left = 390
      Top = 66
      Width = 97
      Height = 23
      TabOrder = 4
    end
    object edtQuantidade: TEdit
      Left = 287
      Top = 66
      Width = 97
      Height = 23
      NumbersOnly = True
      TabOrder = 5
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 99
    Width = 498
    Height = 30
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 207
    ExplicitWidth = 623
    object btnCancelar: TBitBtn
      Left = 403
      Top = 1
      Width = 94
      Height = 28
      Align = alRight
      Caption = '&Cancelar'
      ModalResult = 8
      TabOrder = 1
      ExplicitLeft = 528
    end
    object btnGravar: TBitBtn
      Left = 309
      Top = 1
      Width = 94
      Height = 28
      Align = alRight
      Caption = '&Gravar'
      TabOrder = 0
      OnClick = btnGravarClick
      ExplicitLeft = 528
    end
  end
end
