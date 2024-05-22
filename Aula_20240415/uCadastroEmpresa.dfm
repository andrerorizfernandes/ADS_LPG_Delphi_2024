object frmCadastroEmpresa: TfrmCadastroEmpresa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Empresa'
  ClientHeight = 240
  ClientWidth = 981
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  TextHeight = 15
  object pnlBotoes: TPanel
    Left = 0
    Top = 209
    Width = 981
    Height = 31
    Align = alBottom
    TabOrder = 2
    object btnCancelar: TBitBtn
      Left = 868
      Top = 1
      Width = 112
      Height = 29
      Align = alRight
      Caption = '&Cancelar'
      TabOrder = 4
      OnClick = btnCancelarClick
    end
    object btnInserir: TBitBtn
      Left = 420
      Top = 1
      Width = 112
      Height = 29
      Align = alRight
      Caption = '&Inserir'
      TabOrder = 0
      OnClick = btnInserirClick
    end
    object btnEditar: TBitBtn
      Left = 532
      Top = 1
      Width = 112
      Height = 29
      Align = alRight
      Caption = '&Editar'
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnExcluir: TBitBtn
      Left = 644
      Top = 1
      Width = 112
      Height = 29
      Align = alRight
      Caption = 'E&xcluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnGravar: TBitBtn
      Left = 756
      Top = 1
      Width = 112
      Height = 29
      Align = alRight
      Caption = '&Gravar'
      TabOrder = 3
      OnClick = btnGravarClick
    end
  end
  object pnlCnpj: TPanel
    Left = 0
    Top = 0
    Width = 981
    Height = 52
    Align = alTop
    TabOrder = 0
    object lblCnpj: TLabel
      Left = 7
      Top = 4
      Width = 25
      Height = 15
      Caption = 'Cnpj'
    end
    object edtCnpj: TEdit
      Left = 7
      Top = 21
      Width = 121
      Height = 23
      MaxLength = 14
      NumbersOnly = True
      TabOrder = 0
      OnExit = edtCnpjExit
      OnKeyPress = edtCnpjKeyPress
    end
    object btnPesquisaCnpj: TBitBtn
      Left = 135
      Top = 21
      Width = 80
      Height = 23
      Caption = '&Pesquisa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnPesquisaCnpjClick
    end
  end
  object pnlCampos: TPanel
    Left = 0
    Top = 52
    Width = 981
    Height = 157
    Align = alClient
    TabOrder = 1
    object lblNome: TLabel
      Left = 7
      Top = 8
      Width = 33
      Height = 15
      Caption = 'Nome'
      FocusControl = dbeNome
    end
    object lblTipo: TLabel
      Left = 407
      Top = 8
      Width = 23
      Height = 15
      Caption = 'Tipo'
      FocusControl = dbeTipo
    end
    object lblFantasia: TLabel
      Left = 550
      Top = 8
      Width = 43
      Height = 15
      Caption = 'Fantasia'
      FocusControl = dbeFantasia
    end
    object lblNaturezaJuridica: TLabel
      Left = 7
      Top = 56
      Width = 90
      Height = 15
      Caption = 'Natureza Jur'#237'dica'
      FocusControl = dbeNaturezaJuridica
    end
    object lblLogradouro: TLabel
      Left = 142
      Top = 56
      Width = 62
      Height = 15
      Caption = 'Logradouro'
      FocusControl = dbeLogradouro
    end
    object lblNumero: TLabel
      Left = 550
      Top = 56
      Width = 44
      Height = 15
      Caption = 'N'#250'mero'
      FocusControl = dbeNumero
    end
    object lblBairro: TLabel
      Left = 639
      Top = 56
      Width = 31
      Height = 15
      Caption = 'Bairro'
      FocusControl = dbeBairro
    end
    object lblMunicipio: TLabel
      Left = 7
      Top = 106
      Width = 54
      Height = 15
      Caption = 'Munic'#237'pio'
      FocusControl = dbeMunicipio
    end
    object lblUf: TLabel
      Left = 306
      Top = 106
      Width = 12
      Height = 15
      Caption = 'Uf'
      FocusControl = dbeUf
    end
    object lblCep: TLabel
      Left = 345
      Top = 106
      Width = 19
      Height = 15
      Caption = 'cep'
      FocusControl = dbeCep
    end
    object dbeNome: TDBEdit
      Left = 7
      Top = 24
      Width = 394
      Height = 23
      DataField = 'nome'
      DataSource = DM.dsrEmpresa
      TabOrder = 0
    end
    object dbeTipo: TDBEdit
      Left = 407
      Top = 24
      Width = 137
      Height = 23
      DataField = 'tipo'
      DataSource = DM.dsrEmpresa
      TabOrder = 1
    end
    object dbeFantasia: TDBEdit
      Left = 550
      Top = 24
      Width = 419
      Height = 23
      DataField = 'fantasia'
      DataSource = DM.dsrEmpresa
      TabOrder = 2
    end
    object dbeNaturezaJuridica: TDBEdit
      Left = 7
      Top = 72
      Width = 129
      Height = 23
      DataField = 'naturezajuridica'
      DataSource = DM.dsrEmpresa
      TabOrder = 3
    end
    object dbeLogradouro: TDBEdit
      Left = 142
      Top = 72
      Width = 402
      Height = 23
      DataField = 'logradouro'
      DataSource = DM.dsrEmpresa
      TabOrder = 4
    end
    object dbeNumero: TDBEdit
      Left = 550
      Top = 72
      Width = 84
      Height = 23
      DataField = 'numero'
      DataSource = DM.dsrEmpresa
      TabOrder = 5
    end
    object dbeBairro: TDBEdit
      Left = 639
      Top = 72
      Width = 330
      Height = 23
      DataField = 'bairro'
      DataSource = DM.dsrEmpresa
      TabOrder = 6
    end
    object dbeMunicipio: TDBEdit
      Left = 7
      Top = 122
      Width = 293
      Height = 23
      DataField = 'municipio'
      DataSource = DM.dsrEmpresa
      TabOrder = 7
    end
    object dbeUf: TDBEdit
      Left = 306
      Top = 122
      Width = 34
      Height = 23
      DataField = 'uf'
      DataSource = DM.dsrEmpresa
      TabOrder = 8
    end
    object dbeCep: TDBEdit
      Left = 345
      Top = 122
      Width = 199
      Height = 23
      Color = 14286847
      DataField = 'cep'
      DataSource = DM.dsrEmpresa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 8
      ParentFont = False
      TabOrder = 9
      OnKeyPress = dbeCepKeyPress
    end
  end
end
