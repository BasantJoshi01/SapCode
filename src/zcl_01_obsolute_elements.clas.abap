CLASS zcl_01_obsolute_elements DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_obsolute_elements IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


*   DATA: lt_flights TYPE TABLE OF zdt_dmo_flight,
*          lt_result  TYPE TABLE OF zdt_dmo_flight,
*          lv_carrid  TYPE zdt_dmo_flight-carrier_id VALUE 'LH'.
*
*    SELECT * FROM zdt_dmo_flight INTO TABLE @lt_flights.
*
*    " Filter flights by carrier ID
*    LOOP AT lt_flights INTO DATA(ls_flight).
*      IF ls_flight-carrier_id = lv_carrid.
*        APPEND ls_flight TO lt_result.
*      ENDIF.
*    ENDLOOP.
*
*    out->write( lt_result ).

    DATA: lt_flights TYPE SORTED TABLE OF zdt_dmo_flight WITH NON-UNIQUE KEY carrier_id,
          lv_carrid  TYPE zdt_dmo_flight-carrier_id VALUE 'LH'.

    SELECT * FROM zdt_dmo_flight INTO TABLE @lt_flights.

    " Filter flights by carrier ID
    data(lt_result) = FILTER #( lt_flights WHERE carrier_id = lv_carrid ).

    out->write( lt_result ).


  ENDMETHOD.
ENDCLASS.
