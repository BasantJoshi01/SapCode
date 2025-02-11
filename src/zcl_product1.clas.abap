CLASS zcl_product1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    TYPES: Amount TYPE p LENGTH 10 DECIMALS 2.
    METHODS:
      constructor IMPORTING product_id TYPE string,
      get_unit_price RETURNING VALUE(result) TYPE Amount.
  PROTECTED SECTION.
  PRIVATE SECTION.
     DATA:
      product_id TYPE string,
      unit_price TYPE Amount.
ENDCLASS.



CLASS zcl_product1 IMPLEMENTATION.
METHOD constructor.
    me->product_id = product_id.

  ENDMETHOD.

  METHOD get_unit_price.
    result = cond #( when product_id = '01' then 20
                     when product_id = '02' then 10 ).
  ENDMETHOD.


ENDCLASS.
