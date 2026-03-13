@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Shipment Type Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.query.implementedBy:  'ABAP:ZCL_SHIPMENT_CITY_VH'
@Metadata.allowExtensions: true
define view entity ZI_Shipping_CITY
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                 p_domain_name: 'ZDOM_SHIPMENT_CITY'
                 )

{
  key domain_name as ShipmentCityCode,
      @Semantics.text: true
  key language,
      @Semantics.text: true
      text        as ShipmentCityText
}
