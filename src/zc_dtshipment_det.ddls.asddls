@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZDTSHIPMENT_DET'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_DTSHIPMENT_DET
  provider contract transactional_query
  as projection on ZR_DTSHIPMENT_DET
  association [1..1] to ZR_DTSHIPMENT_DET as _BaseEntity on  $projection.Guiid      = _BaseEntity.Guiid
                                                         and $projection.ShipmentID = _BaseEntity.ShipmentID
{
  key Guiid,
  key ShipmentID,
      @Semantics.imageUrl: true
      FlighImage,
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZI_DOM_SHIPT_TYPE', element: 'ShipmentDescription'}}]
      ShipmentType,
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CountryVH', element: 'Country'}}]
      OriginLocation,
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CountryVH', element: 'Country'}}]
      DestinationLocation,
      DistanceKm,
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZI_SHIP_STATUS_CHECK', element: 'StatusDescription'}}]
      CurrentStatus,
      EtaDays,
      DelayHours,
      DelayRisk,
      DelayRiskCrit,
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_RegionVH', element: 'Region'}}]
      OrginRegion,
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_RegionVH', element: 'Region'}}]
      DestinationRegion,
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_RegionVH', element: 'Region' }}]
      CurrentRegion,
      Orginlatitude,
      Orginlongitude,
      Destinationlatitude,
      Destinationlongitude,
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZI_Shipping_CITY', element: 'ShipmentCityText'}}]
      CurrentCity,
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZI_Shipping_CITY', element: 'ShipmentCityText'}}]
      DestinationCity,
      AiSummary,
      @UI.multiLineText: true
      AiResponse,
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
      _BaseEntity,
      _ShipmentType,
      _Country,
      _ShipmentTrackEvent : redirected to composition child ZC_SHIPMETNT_TRACKER,
      _PredictionLog      : redirected to composition child ZC_AI_PREDICTLOG

}
