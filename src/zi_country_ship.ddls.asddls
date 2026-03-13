@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Country Value Help'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_COUNTRY_ship
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'COUNTRY' )
{
  key domain_name,
  key value_position,
      @Semantics.language: true
  key language,
      value_low as Value,
      @Semantics.text: true
      text      as country_name
}
