@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Shipment Tracking Event'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_SHIPMETNT_TRACKER
  as projection on ZR_SHIPMENT_TRACKER
{
  key Guiid,
  key EventID,
  key ShipmentID,
      EventType,
      EventLocation,
      EventTime,
      Remarks,
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
      /* Associations */
      _ShipmentDetails : redirected to parent ZC_DTSHIPMENT_DET
}
