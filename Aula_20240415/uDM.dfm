object DM: TDM
  Height = 480
  Width = 640
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=ads'
      'User_Name=root'
      'Password=18071988'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\andre\Downloads\ADS_LPG_Delphi_2024\Aula_20240415\Lib\l' +
      'ibmysql.dll'
    Left = 40
    Top = 96
  end
  object qryAluno: TFDQuery
    FilterOptions = [foCaseInsensitive]
    Connection = Conexao
    SQL.Strings = (
      'SELECT '
      '  a.id, '
      '  a.matricula, '
      '  a.nome, '
      '  a.curso,'
      '  a.idusuario,'
      '  u.nome as usuario'
      'FROM aluno a'
      'INNER JOIN usuario u ON u.id=a.idusuario and u.excluido = '#39'N'#39
      'ORDER BY a.curso, a.nome')
    Left = 176
    Top = 24
    object qryAlunoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = False
      Visible = False
      IdentityInsert = True
    end
    object qryAlunomatricula: TStringField
      FieldName = 'matricula'
      Origin = 'matricula'
      Required = True
      Size = 10
    end
    object qryAlunonome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object qryAlunocurso: TStringField
      FieldName = 'curso'
      Origin = 'curso'
      Required = True
      Size = 30
    end
    object qryAlunoidusuario: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Visible = False
    end
    object qryAlunousuario: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usuario'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
  end
  object dsrAluno: TDataSource
    DataSet = qryAluno
    Left = 184
    Top = 32
  end
  object qryUsuario: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT           '
      '  u.id,          '
      '  u.nome,    '
      '  u.cpf,         '
      '  u.identidade,'
      '  u.excluido  '
      'FROM usuario u  '
      'Where u.excluido = '#39'N'#39' '
      'ORDER BY nome')
    Left = 256
    Top = 24
    object qryUsuarioid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = False
      IdentityInsert = True
    end
    object qryUsuarionome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 60
    end
    object qryUsuariocpf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cpf'
      Origin = 'cpf'
      EditMask = '999\.999\.999\-99;0;_'
      Size = 14
    end
    object qryUsuarioidentidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'identidade'
      Origin = 'identidade'
      Size = 18
    end
    object qryUsuarioexcluido: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'excluido'
      Origin = 'excluido'
      FixedChar = True
      Size = 1
    end
  end
  object dsrUsuario: TDataSource
    DataSet = qryUsuario
    Left = 264
    Top = 32
  end
  object qrySQLTemporario: TFDQuery
    Connection = Conexao
    Left = 424
    Top = 24
  end
  object qryEmpresa: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select'
      
        '  e.codempresa, e.cnpj, e.nome, e.tipo, e.fantasia, e.naturezaju' +
        'ridica,'
      '  e.logradouro, e.numero, e.bairro, e.municipio, e.uf, e.cep'
      'from empresa e'
      'where e.cnpj =:cnpj')
    Left = 336
    Top = 24
    ParamData = <
      item
        Name = 'CNPJ'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryEmpresacodempresa: TFDAutoIncField
      FieldName = 'codempresa'
      Origin = 'codempresa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = False
      IdentityInsert = True
    end
    object qryEmpresacnpj: TStringField
      FieldName = 'cnpj'
      Origin = 'cnpj'
      Required = True
      Size = 14
    end
    object qryEmpresanome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object qryEmpresatipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      Size = 50
    end
    object qryEmpresafantasia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fantasia'
      Origin = 'fantasia'
      Size = 80
    end
    object qryEmpresanaturezajuridica: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'naturezajuridica'
      Origin = 'naturezajuridica'
      Size = 50
    end
    object qryEmpresalogradouro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'logradouro'
      Origin = 'logradouro'
      Size = 150
    end
    object qryEmpresanumero: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'numero'
      Origin = 'numero'
      Size = 50
    end
    object qryEmpresabairro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 50
    end
    object qryEmpresamunicipio: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'municipio'
      Origin = 'municipio'
      Size = 70
    end
    object qryEmpresauf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
    object qryEmpresacep: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cep'
      Origin = 'cep'
      Size = 13
    end
  end
  object dsrEmpresa: TDataSource
    DataSet = qryEmpresa
    Left = 344
    Top = 32
  end
end
