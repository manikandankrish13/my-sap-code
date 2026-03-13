CLASS zcl_shipment_city_vh DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_shipment_city_vh IMPLEMENTATION.


  METHOD if_rap_query_provider~select.

    DATA lt_create TYPE TABLE OF zi_shipping_city WITH EMPTY KEY.

*  DATA: lt_create TYPE STANDARD TABLE OF  zcdi_status_vh WITH EMPTY KEY.

    lt_create = VALUE #( ( shipmentcitycode = '1'  shipmentcitytext = 'Ariyalur' language = 'E' )
( shipmentcitycode = '2'  shipmentcitytext = 'Chengalpattu' language = 'E' )
( shipmentcitycode = '3'  shipmentcitytext = 'Chennai' language = 'E' )
( shipmentcitycode = '4'  shipmentcitytext = 'Coimbatore' language = 'E' )
( shipmentcitycode = '5'  shipmentcitytext = 'Cuddalore' language = 'E' )
( shipmentcitycode = '6'  shipmentcitytext = 'Dharmapuri' language = 'E' )
( shipmentcitycode = '7'  shipmentcitytext = 'Dindigul' language = 'E' )
( shipmentcitycode = '8'  shipmentcitytext = 'Erode' language = 'E' )
( shipmentcitycode = '9'  shipmentcitytext = 'Kallakurichi' language = 'E' )
( shipmentcitycode = '10' shipmentcitytext = 'Kancheepuram' language = 'E' )
( shipmentcitycode = '11' shipmentcitytext = 'Karur' language = 'E' )
( shipmentcitycode = '12' shipmentcitytext = 'Krishnagiri' language = 'E' )
( shipmentcitycode = '13' shipmentcitytext = 'Madurai' language = 'E' )
( shipmentcitycode = '14' shipmentcitytext = 'Mayiladuthurai' language = 'E' )
( shipmentcitycode = '15' shipmentcitytext = 'Nagapattinam' language = 'E' )
( shipmentcitycode = '16' shipmentcitytext = 'Namakkal' language = 'E' )
( shipmentcitycode = '17' shipmentcitytext = 'Nilgiris' language = 'E' )
( shipmentcitycode = '18' shipmentcitytext = 'Perambalur' language = 'E' )
( shipmentcitycode = '19' shipmentcitytext = 'Pudukkottai' language = 'E' )
( shipmentcitycode = '20' shipmentcitytext = 'Ramanathapuram' language = 'E' )
( shipmentcitycode = '21' shipmentcitytext = 'Ranipet' language = 'E' )
( shipmentcitycode = '22' shipmentcitytext = 'Salem' language = 'E' )
( shipmentcitycode = '23' shipmentcitytext = 'Sivagangai' language = 'E' )
( shipmentcitycode = '24' shipmentcitytext = 'Tenkasi' language = 'E' )
( shipmentcitycode = '25' shipmentcitytext = 'Thanjavur' language = 'E' )
( shipmentcitycode = '26' shipmentcitytext = 'Theni' language = 'E' )
( shipmentcitycode = '27' shipmentcitytext = 'Thoothukudi' language = 'E' )
( shipmentcitycode = '28' shipmentcitytext = 'Tiruchirappalli' language = 'E' )
( shipmentcitycode = '29' shipmentcitytext = 'Tirunelveli' language = 'E' )
( shipmentcitycode = '30' shipmentcitytext = 'Tirupathur' language = 'E' )
( shipmentcitycode = '31' shipmentcitytext = 'Tiruppur' language = 'E' )
( shipmentcitycode = '32' shipmentcitytext = 'Tiruvallur' language = 'E' )
( shipmentcitycode = '33' shipmentcitytext = 'Tiruvannamalai' language = 'E' )
( shipmentcitycode = '34' shipmentcitytext = 'Tiruvarur' language = 'E' )
( shipmentcitycode = '35' shipmentcitytext = 'Vellore' language = 'E' )
( shipmentcitycode = '36' shipmentcitytext = 'Viluppuram' language = 'E' )
( shipmentcitycode = '37' shipmentcitytext = 'Virudhunagar' language = 'E' )
( shipmentcitycode = '38' shipmentcitytext = 'Kanyakumari' language = 'E' )

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
