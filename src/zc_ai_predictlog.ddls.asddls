@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'AI Prediction Log'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_AI_PREDICTLOG
  as projection on ZR_AI_PREDICTLOG
{
  key Guiid,
  key RequestID,
  key ShipmentID,
      Aiactiontype,
//      @Semantics.largeObject: { 
//      acceptableMimeTypes: ['image/png', 'image/jpeg'],
//      contentDispositionPreference: #ATTACHMENT }
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
      /* Associations */
      _Predection : redirected to parent ZC_DTSHIPMENT_DET
}
