@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZDTAIPREDICTLOG'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define view entity ZR_AI_PREDICTLOG
  as select from zdt_aipredictlog
  association to parent ZR_DTSHIPMENT_DET as _Predection on  $projection.Guiid      = _Predection.Guiid
  //                                                         and $projection.RequestID  = _Predection.RequestID
                                                         and $projection.ShipmentID = _Predection.ShipmentID

{
  key guiid            as Guiid,
  key request_id       as RequestID,
  key shipment_id      as ShipmentID,
      aiactiontype     as Aiactiontype,
      inputsnapshot    as Inputsnapshot,
      airesponse       as Airesponse,
      calledat         as Calledat,
      @Semantics.user.createdBy: true
      created_by       as CreatedBy,
      created_at       as CreatedAt,
      @Semantics.user.lastChangedBy: true
      changed_by       as ChangedBy,
      changed_at       as ChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      locallastchanged as Locallastchanged,
      @Semantics.systemDateTime.lastChangedAt: true
      lastchanged      as Lastchanged,
      _Predection
}
