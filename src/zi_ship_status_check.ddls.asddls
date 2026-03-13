@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Shipment Status Value Help'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.query.implementedBy: 'ABAP:ZCL_SHIPMENT_STATUS_VH'
define view entity ZI_SHIP_STATUS_CHECK
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                 p_domain_name : 'ZI_STATUS')
{
  key domain_name as StatusCode,
  key value_position,
      @Semantics.text: true
  key language,
      //      value_low as value,
      @Semantics.text: true
      text        as StatusDescription

}
