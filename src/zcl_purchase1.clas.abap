CLASS zcl_purchase1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    METHODS:
      constructor IMPORTING customer_id   TYPE string
                            purchase_date TYPE d
                            quantity      TYPE i
                            gender        TYPE string
                            product       TYPE REF TO zcl_product1,
      get_quantity RETURNING VALUE(quantity) TYPE i,
      get_gender RETURNING VALUE(gender) TYPE string,
      get_product RETURNING VALUE(product) TYPE REF TO zcl_product1.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA:
      customer_id   TYPE string,
      purchase_date TYPE d,
      quantity      TYPE i,
      gender        TYPE string,
      product       TYPE REF TO zcl_product1.

ENDCLASS.



CLASS zcl_purchase1 IMPLEMENTATION.
  METHOD constructor.
    me->customer_id = customer_id.
    me->purchase_date = purchase_date.
    me->quantity = quantity.
    me->gender = gender.
    me->product = product.

  ENDMETHOD.

  METHOD get_quantity.
    quantity = me->quantity.
  ENDMETHOD.

  METHOD get_gender.

    gender = me->gender.
  ENDMETHOD.

  METHOD get_product.
    product = me->product.
  ENDMETHOD.



  METHOD if_oo_adt_classrun~main.
  ENDMETHOD.
ENDCLASS.
