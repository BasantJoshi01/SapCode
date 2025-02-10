CLASS zcl_01_assignment_encap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    TYPES: BEGIN OF lty_employee,
             first_name TYPE string,
             last_name  TYPE string,
           END OF lty_employee.
    DATA: ls_employee TYPE lty_employee.

    METHODS: set_employee_name
     IMPORTING
       first_name TYPE string
       last_name  TYPE string

       RETURNING VALUE(result) type lty_employee.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_01_assignment_encap IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  data(name) = set_employee_name( first_name = 'Vicky' last_name = 'Joshi' ).
  out->write( name ).


  ENDMETHOD.


  METHOD set_employee_name.

    data(lv_out1) = to_upper( first_name ).
    data(lv_out2) = to_upper( last_name ).


    result = VALUE #(  first_name  = lv_out1
                       last_name =  lv_out2
    ).


  ENDMETHOD.



ENDCLASS.
