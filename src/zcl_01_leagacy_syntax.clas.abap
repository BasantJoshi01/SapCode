CLASS zcl_01_leagacy_syntax DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_leagacy_syntax IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*
*  CLASS zcl_01_legacy_syntax DEFINITION
*  PUBLIC
*  FINAL
*  CREATE PUBLIC .
*
*  PUBLIC SECTION.
*    INTERFACES if_oo_adt_classrun.
*  PROTECTED SECTION.
*  PRIVATE SECTION.
*ENDCLASS.
*
*CLASS zcl_01_legacy_syntax IMPLEMENTATION.
*  METHOD if_oo_adt_classrun~main.
*    DATA: lv_name TYPE string.
*    MOVE 'John' TO lv_name.
*    TRANSLATE lv_name TO UPPER CASE.
*    out->write( lv_name ).
*  ENDMETHOD.
*ENDCLASS.
*

    DATA(Output) = to_upper( 'Vicky' ).
    out->write( Output ).

  ENDMETHOD.



ENDCLASS.
