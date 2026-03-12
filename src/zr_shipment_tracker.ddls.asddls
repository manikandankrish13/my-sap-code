@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZDTSHIP_TRACKER'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define view entity ZR_SHIPMENT_TRACKER
  as select from zdt_ship_tracker
  association to parent ZR_DTSHIPMENT_DET as _ShipmentDetails on  $projection.Guiid      = _ShipmentDetails.Guiid
//                                                                and $projection.EventID    = _ShipmentDetails.
                                                              and $projection.ShipmentID = _ShipmentDetails.ShipmentID
  //  association [1..1] to ZR_SHIPMENT_TRACKER as _BaseEntity on  $projection.Guiid      = _BaseEntity.Guiid
  //                                                           and $projection.EventID    = _BaseEntity.EventID
  //                                                           and $projection.ShipmentID = _BaseEntity.ShipmentID
{
  key guiid            as Guiid,
  key event_id         as EventID,
  key shipment_id      as ShipmentID,
      event_type       as EventType,
      event_location   as EventLocation,
      event_time       as EventTime,
      remarks          as Remarks,
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

      // Associations,
      _ShipmentDetails
}
