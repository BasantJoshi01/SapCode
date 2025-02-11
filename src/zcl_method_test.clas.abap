CLASS zcl_method_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_method_test IMPLEMENTATION.

 METHOD if_oo_adt_classrun~main.

    data(TooMany) = new zcl_method_04_too_many( ).
    data(Discount) = TooMany->calculate_discount( product_id = '01'
                                                  customer_id = 'CUST1'
                                                  purchase_date = '20250101'
                                                  quantity = 2 ).


    data(Product) = new zcl_product1( '01' ).

    data(Purchase) = new zcl_purchase1( customer_id = 'CUST1'
                                                  purchase_date = '20250101'
                                                  quantity = 2
                                                  gender = 'F'
                                                  product = Product ).

    Discount = new zcl_02_adddiscount( )->calculate_discount( Purchase ).

  ENDMETHOD.
ENDCLASS.
