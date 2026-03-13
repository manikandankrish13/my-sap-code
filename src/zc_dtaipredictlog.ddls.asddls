@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZDTAIPREDICTLOG'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_DTAIPREDICTLOG
  provider contract transactional_query
  as projection on ZR_DTAIPREDICTLOG
  association [1..1] to ZR_DTAIPREDICTLOG as _BaseEntity on  $projection.Guiid      = _BaseEntity.Guiid
                                                         and $projection.RequestID  = _BaseEntity.RequestID
                                                         and $projection.ShipmentID = _BaseEntity.ShipmentID
{
  key Guiid,
  key RequestID,
  key ShipmentID,
      Aiactiontype,
      Inputsnapshot,
      Airesponse,
      Calledat,
      @Semantics: {
        user.createdBy: true
      }
      CreatedBy,
      CreatedAt,
      @Semantics: {
        user.lastChangedBy: true
      }
      ChangedBy,
      ChangedAt,
      @Semantics: {
        systemDateTime.localInstanceLastChangedAt: true
      }
      Locallastchanged,
      @Semantics: {
        systemDateTime.lastChangedAt: true
      }
      Lastchanged,
      _BaseEntity
}
