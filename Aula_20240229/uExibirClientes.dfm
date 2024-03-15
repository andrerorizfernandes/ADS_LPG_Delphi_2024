object frmExibirClientes: TfrmExibirClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Clientes'
  ClientHeight = 394
  ClientWidth = 978
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
  object dbgCliente: TDBGrid
    Left = 0
    Top = 0
    Width = 978
    Height = 394
    Align = alClient
    DataSource = dsrCliente
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
    Columns = <
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 227
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Idade'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cpf'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Identidade'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sexo'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EstadoCivil'
        Title.Caption = 'Estado Civil'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observacoes'
        Title.Caption = 'Observa'#231#245'es'
        Width = 190
        Visible = True
      end>
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 56
    object cdsClienteNome: TStringField
      FieldName = 'Nome'
      Size = 60
    end
    object cdsClienteIdade: TStringField
      FieldName = 'Idade'
      Size = 3
    end
    object cdsClienteCpf: TStringField
      FieldName = 'Cpf'
      Size = 11
    end
    object cdsClienteIdentidade: TStringField
      FieldName = 'Identidade'
      Size = 25
    end
    object cdsClienteSexo: TStringField
      FieldName = 'Sexo'
      Size = 10
    end
    object cdsClienteEstadoCivil: TStringField
      FieldName = 'EstadoCivil'
    end
    object cdsClienteObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 2000
    end
  end
  object dsrCliente: TDataSource
    DataSet = cdsCliente
    Left = 256
    Top = 56
  end
end
