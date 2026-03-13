CLASS zcl_shipment_status_vh DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_shipment_status_vh IMPLEMENTATION.


  METHOD if_rap_query_provider~select.
    DATA lt_create TYPE TABLE OF zi_ship_status_check WITH EMPTY KEY.

*  DATA: lt_create TYPE STANDARD TABLE OF  zcdi_status_vh WITH EMPTY KEY.

    lt_create = VALUE #( ( statuscode = '1'  statusdescription = 'On-Time' language = 'E' )
                         ( statuscode = '2'  statusdescription = 'In-Transict' language = 'E' )
                         ( statuscode = '3'  statusdescription = 'Delivered' language = 'E' )
                         ( statuscode = '4'  statusdescription = 'Arrived at Hub' language = 'E' )
                         ( statuscode = '5'  statusdescription = 'Shipped' language = 'E' )
                         ( statuscode = '6'  statusdescription = 'Out for Delivery' language = 'E' )
                         ( statuscode = '7'  statusdescription = 'Delay' language = 'E' )
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
