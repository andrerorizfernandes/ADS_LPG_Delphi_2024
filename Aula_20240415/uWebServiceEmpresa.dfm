object WebServiceEmpresa: TWebServiceEmpresa
  Height = 132
  Width = 485
  object rstCliente: TRESTClient
    Params = <>
    SynchronizedEvents = False
    Left = 40
    Top = 32
  end
  object rstRequisicao: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = rstCliente
    Params = <>
    Response = rstResposta
    SynchronizedEvents = False
    Left = 120
    Top = 32
  end
  object rstResposta: TRESTResponse
    Left = 208
    Top = 32
  end
  object rstAdaptadorResposta: TRESTResponseDataSetAdapter
    Dataset = mdtEmpresa
    FieldDefs = <>
    Response = rstResposta
    TypesMode = Rich
    Left = 288
    Top = 32
  end
  object mdtEmpresa: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    Left = 352
    Top = 32
  end
end
