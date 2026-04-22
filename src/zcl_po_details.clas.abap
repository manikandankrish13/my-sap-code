CLASS zcl_po_details DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_po_overview,
             header  TYPE ekko,
             items   TYPE STANDARD TABLE OF ekpo WITH EMPTY KEY,
             history TYPE STANDARD TABLE OF ekbe WITH EMPTY KEY,
           END OF ty_po_overview.

    METHODS get_po_header
      IMPORTING
        iv_ebeln       TYPE ebeln
      RETURNING
        VALUE(rs_ekko) TYPE ekko.

    METHODS get_po_items
      IMPORTING
        iv_ebeln      TYPE ebeln
      RETURNING
        VALUE(rt_ekpo) TYPE STANDARD TABLE OF ekpo WITH EMPTY KEY.

    METHODS get_po_history
      IMPORTING
        iv_ebeln      TYPE ebeln
      RETURNING
        VALUE(rt_ekbe) TYPE STANDARD TABLE OF ekbe WITH EMPTY KEY.

    METHODS get_po_overview
      IMPORTING
        iv_ebeln              TYPE ebeln
      RETURNING
        VALUE(rs_po_overview) TYPE ty_po_overview.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_po_details IMPLEMENTATION.
  METHOD get_po_header.
    SELECT SINGLE *
      FROM ekko
      WHERE ebeln = @iv_ebeln
      INTO @rs_ekko.
  ENDMETHOD.

  METHOD get_po_items.
    SELECT *
      FROM ekpo
      WHERE ebeln = @iv_ebeln
      INTO TABLE @rt_ekpo.
  ENDMETHOD.

  METHOD get_po_history.
    SELECT *
      FROM ekbe
      WHERE ebeln = @iv_ebeln
      INTO TABLE @rt_ekbe.
  ENDMETHOD.

  METHOD get_po_overview.
    rs_po_overview-header = get_po_header( iv_ebeln ).
    rs_po_overview-items = get_po_items( iv_ebeln ).
    rs_po_overview-history = get_po_history( iv_ebeln ).
  ENDMETHOD.
ENDCLASS.
