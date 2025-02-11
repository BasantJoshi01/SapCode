CLASS zcl_improvedperformance DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_improvedperformance IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*   DATA: lt_numbers TYPE TABLE OF i,
*          lv_sum     TYPE i.

*    " Populate table with numbers
*    DO 1000 TIMES.
*      APPEND sy-index TO lt_numbers.
*    ENDDO.
*
*    " Calculate sum
*    LOOP AT lt_numbers INTO DATA(lv_number).
*      lv_sum = lv_sum + lv_number.
*    ENDLOOP.
*
*    out->write( |Sum: { lv_sum }| ).

    " Improved Code

    DATA : d TYPE p DECIMALS 3.

    DATA(lv_sum) = REDUCE d( INIT sum = 0
                        FOR j = 1 UNTIL j > 1000
                        NEXT sum = sum + j ).

    out->write( |Sum: { lv_sum }| ).


  ENDMETHOD.
ENDCLASS.
