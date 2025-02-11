CLASS zcl_02_adddiscount DEFINITION
  PUBLIC


  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

 TYPES: Amount TYPE p LENGTH 10 DECIMALS 2.
    METHODS:
      calculate_discount IMPORTING purchase        TYPE REF TO zcl_purchase1
                         RETURNING VALUE(discount) TYPE Amount.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS:
      discount_rate TYPE f VALUE '0.1'.


ENDCLASS.



CLASS zcl_02_adddiscount IMPLEMENTATION.

 METHOD calculate_discount.

    data(d_rate) =  cond #(  when purchase->get_gender(  ) = 'F' then '0.2'
                                    else discount_rate
     ).

    discount = purchase->get_quantity( ) * purchase->get_product( )->get_unit_price( ) * d_rate.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.


  ENDMETHOD.



ENDCLASS.
