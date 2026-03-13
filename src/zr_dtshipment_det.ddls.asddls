@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZDTSHIPMENT_DET'
@EndUserText.label: 'Shipment Tracking Application - Shipment Details'
define root view entity ZR_DTSHIPMENT_DET
  as select from zdt_shipment_det
  composition [0..*] of ZR_SHIPMENT_TRACKER as _ShipmentTrackEvent
  composition [0..*] of ZR_AI_PREDICTLOG    as _PredictionLog
  association [0..*] to ZI_DOM_SHIPT_TYPE   as _ShipmentType on $projection.ShipmentType = _ShipmentType.ShipmentCode
  association [0..*] to ZI_COUNTRY_ship     as _Country      on $projection.OriginLocation = _Country.country_name

{
  key guiid                as Guiid,
  key shipment_id          as ShipmentID,
      @Semantics.imageUrl: true
      flight_image         as FlighImage,
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZI_DOM_SHIPT_TYPE', element: 'ShipmentDescription'}}]
      shipment_type        as ShipmentType,
      @Consumption.valueHelpDefinition: [{entity: { name: 'I_CountryVH', element: 'Country'}}]
      origin_location      as OriginLocation,
      @Consumption.valueHelpDefinition: [{entity: { name: 'I_CountryVH', element: 'Country'}}]
      destination_location as DestinationLocation,
      distance_km          as DistanceKm,
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZI_Ship_STATUS_CHECK', element: 'StatusDescription'}}]
      current_status       as CurrentStatus,
      eta_days             as EtaDays,
      delay_hours          as DelayHours,
      delay_risk           as DelayRisk,
      delay_risk_crit      as DelayRiskCrit,
      ai_summary           as AiSummary,
      ai_response          as AiResponse,
      orgin_region         as OrginRegion,
      destination_region   as DestinationRegion,
      current_region       as CurrentRegion,
      orginlatitude        as Orginlatitude,
      orginlongitude       as Orginlongitude,
      destinationlatitude  as Destinationlatitude,
      destinationlongitude as Destinationlongitude,
      current_city         as CurrentCity,
      destination_city     as DestinationCity,
      @Semantics.user.createdBy: true
      created_by           as CreatedBy,
      created_at           as CreatedAt,
      @Semantics.user.lastChangedBy: true
      changed_by           as ChangedBy,
      changed_at           as ChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      locallastchanged     as Locallastchanged,
      @Semantics.systemDateTime.lastChangedAt: true
      lastchanged          as Lastchanged,
      _ShipmentTrackEvent,
      _PredictionLog,
      _ShipmentType,
      _Country
}
