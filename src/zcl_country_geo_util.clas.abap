CLASS zcl_country_geo_util DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS fetch_store_cordinates
      IMPORTING
                iv_country_iso_org      TYPE land1
                iv_country_iso_dest     TYPE land1
                iv_country_name         TYPE string OPTIONAL
      RETURNING VALUE(ls_country_coord) TYPE zcountry_coord.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_country_geo_util IMPLEMENTATION.
  METHOD fetch_store_cordinates.
    DATA:
      lo_http_dest TYPE REF TO if_http_destination,
      lo_client    TYPE REF TO if_web_http_client,
      lo_response  TYPE REF TO if_web_http_response,
      lv_json      TYPE string,
      lv_lat       TYPE decfloat34,
      lv_lon       TYPE decfloat34.

    TRY.
        lo_http_dest = cl_http_destination_provider=>create_by_url(
        i_url = 'https://geocoding-api.open-meteo.com'
        ).
      CATCH cx_http_dest_provider_error.
        "handle exception
    ENDTRY.

    TRY.
        lo_client = cl_web_http_client_manager=>create_by_http_destination(
        lo_http_dest ).
      CATCH cx_web_http_client_error.
        "handle exception
    ENDTRY.

    lo_client->get_http_request( )->set_uri_path(
    |/v1/search?name={ iv_country_name }&count=1|
    ).

    lo_client->get_http_request( )->set_header_field(
    i_name = 'Accept'
    i_value = 'application/json'
    ).

    TRY.
        lo_response = lo_client->execute( if_web_http_client=>get ).
      CATCH cx_web_http_client_error.
        "handle exception
    ENDTRY.

    lv_json = lo_response->get_text( ).

    TYPES: BEGIN OF ty_result,
             latitude  TYPE decfloat34,
             longitude TYPE decfloat34,
           END OF ty_result.

    TYPES: BEGIN OF ty_response,
             results TYPE STANDARD TABLE OF ty_result WITH EMPTY KEY,
           END OF ty_response.

    DATA(ls_response) = VALUE ty_response( ).

    /ui2/cl_json=>deserialize(
    EXPORTING json = lv_json
    CHANGING data = ls_response
    ).

    READ TABLE ls_response-results INDEX 1 INTO DATA(ls_result).
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.

    ls_country_coord-country_org = iv_country_iso_org.
    ls_country_coord-country_dest = iv_country_iso_dest.
    ls_country_coord-latitude = ls_result-latitude.
    ls_country_coord-longitude = ls_result-longitude.
    ls_country_coord-createdby = sy-uname.
  ENDMETHOD.
ENDCLASS.
