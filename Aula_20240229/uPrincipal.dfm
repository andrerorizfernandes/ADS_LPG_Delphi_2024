object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de cliente'
  ClientHeight = 280
  ClientWidth = 652
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 15
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 652
    Height = 250
    Align = alClient
    TabOrder = 0
    object lblNome: TLabel
      Left = 7
      Top = 8
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object lblIdade: TLabel
      Left = 563
      Top = 8
      Width = 29
      Height = 15
      Caption = 'Idade'
    end
    object lblCpf: TLabel
      Left = 7
      Top = 56
      Width = 21
      Height = 15
      Caption = 'CPF'
    end
    object lblIdentidade: TLabel
      Left = 177
      Top = 56
      Width = 56
      Height = 15
      Caption = 'Identidade'
    end
    object lblSexo: TLabel
      Left = 347
      Top = 56
      Width = 25
      Height = 15
      Caption = 'Sexo'
    end
    object lblEstadoCivil: TLabel
      Left = 498
      Top = 56
      Width = 61
      Height = 15
      Caption = 'Estado Civil'
    end
    object lblObservacoes: TLabel
      Left = 7
      Top = 106
      Width = 67
      Height = 15
      Caption = 'Observa'#231#245'es'
    end
    object edtNome: TEdit
      Left = 7
      Top = 24
      Width = 550
      Height = 23
      TabOrder = 0
    end
    object edtIdade: TEdit
      Left = 563
      Top = 24
      Width = 80
      Height = 23
      MaxLength = 3
      NumbersOnly = True
      TabOrder = 1
    end
    object edtCpf: TEdit
      Left = 7
      Top = 72
      Width = 164
      Height = 23
      MaxLength = 11
      NumbersOnly = True
      TabOrder = 2
    end
    object edtIdentidade: TEdit
      Left = 177
      Top = 72
      Width = 164
      Height = 23
      MaxLength = 25
      NumbersOnly = True
      TabOrder = 3
    end
    object cboSexo: TComboBox
      Left = 347
      Top = 72
      Width = 145
      Height = 23
      Style = csDropDownList
      TabOrder = 4
    end
    object cboEstadoCivil: TComboBox
      Left = 498
      Top = 72
      Width = 145
      Height = 23
      Style = csDropDownList
      TabOrder = 5
    end
    object memObservacoes: TMemo
      Left = 7
      Top = 122
      Width = 636
      Height = 119
      TabOrder = 6
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 250
    Width = 652
    Height = 30
    Align = alBottom
    TabOrder = 1
    object btnCancelar: TBitBtn
      Left = 548
      Top = 1
      Width = 103
      Height = 28
      Hint = 'Clique aqui para cancelar'
      Align = alRight
      Caption = '&Cancelar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object btnGravar: TBitBtn
      Left = 445
      Top = 1
      Width = 103
      Height = 28
      Hint = 'Clique aqui para gravar'
      Align = alRight
      Caption = '&Gravar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object btnExibirMensagem: TBitBtn
      Left = 342
      Top = 1
      Width = 103
      Height = 28
      Hint = 'Clique aqui para gravar'
      Align = alRight
      Caption = '&Mensagem'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnExibirMensagemClick
      ExplicitLeft = 445
    end
  end
end
