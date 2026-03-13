@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Shipment Type Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.query.implementedBy:  'ABAP:ZCL_SHIPMENT_TYPE_VH'
@Metadata.allowExtensions: true
define view entity ZI_DOM_SHIPT_TYPE
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                 p_domain_name: 'ZDOM_SHIPMENT_TYPE'
                 )

{
  key domain_name as ShipmentCode,
      @Semantics.text: true
  key language,
      @Semantics.text: true
      text        as ShipmentDescription
}
