@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZDTAIPREDICTLOG'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_DTAIPREDICTLOG
  as select from zdt_aipredictlog
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
      lastchanged      as Lastchanged
}
