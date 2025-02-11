CLASS zcl_02_audiobookcode DEFINITION
  PUBLIC

  INHERITING FROM zcl_method_03_library

  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .


    METHODS calculate_fine REDEFINITION.
    METHODS get_title REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
   CONSTANTS: c_value TYPE f VALUE '1.5'.
ENDCLASS.



CLASS zcl_02_audiobookcode IMPLEMENTATION.


  METHOD calculate_fine.



  result = days_overdue  * c_value.



  ENDMETHOD.

  METHOD get_title.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

  data(fine) =  calculate_fine( days_overdue = 2 ).
  out->write( fine ).

  ENDMETHOD.
ENDCLASS.
