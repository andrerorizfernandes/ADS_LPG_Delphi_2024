object DM: TDM
  Height = 480
  Width = 640
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=ads'
      'User_Name=root'
      'Password=18071988'
      'DriverID=MySQL')
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
    Connection = Conexao
    SQL.Strings = (
      'SELECT '
      '  a.id, '
      '  a.matricula, '
      '  a.nome, '
      '  a.curso,'
      '  a.idusuario,'
      '  u.clientes usuario'
      'FROM aluno a'
      'left JOIN usuario u ON u.id=a.idusuario'
      'ORDER BY curso, nome')
    Left = 176
    Top = 24
    object qryAlunoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = False
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
    end
    object qryAlunousuario: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'usuario'
      Origin = 'clientes'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
  end
  object dsrAluno: TDataSource
    DataSet = qryAluno
    Left = 240
    Top = 24
  end
end
