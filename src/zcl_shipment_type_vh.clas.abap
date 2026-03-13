CLASS zcl_shipment_type_vh DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_shipment_type_vh IMPLEMENTATION.


  METHOD if_rap_query_provider~select.

    DATA lt_create TYPE TABLE OF zi_dom_shipt_type WITH EMPTY KEY.

*  DATA: lt_create TYPE STANDARD TABLE OF  zcdi_status_vh WITH EMPTY KEY.

    lt_create = VALUE #( ( shipmentcode = 'R'  shipmentdescription = 'Road' language = 'E' )
                         ( shipmentcode = 'A'  shipmentdescription = 'Air' language = 'E' )
                         ( shipmentcode = 'T'  shipmentdescription = 'Train' language = 'E' )
                         ( shipmentcode = 'B'  shipmentdescription = 'Bus' language = 'E' )
                         ( shipmentcode = 'S'  shipmentdescription = 'Sea' language = 'E' )
                         ( shipmentcode = 'O'  shipmentdescription = 'Others' language = 'E' )
     ).


    IF io_request->is_data_requested( ).
      io_response->set_data( lt_create ).
    ENDIF.

    IF io_request->is_total_numb_of_rec_requested( ).
      io_response->set_total_number_of_records( lines( lt_create ) ).
    ENDIF.

    io_request->get_sort_elements( ).
    io_request->get_paging( ).
  ENDMETHOD.
ENDCLASS.
