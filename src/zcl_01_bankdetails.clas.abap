CLASS zcl_01_bankdetails DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    METHODS : DepositMoney
      IMPORTING iv_money TYPE i,
      WithDrowMoney IMPORTING iv_money TYPE i,
      GetBankBalance RETURNING VALUE(result) TYPE i.



  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA  :lv_totaldepo TYPE i.
ENDCLASS.



CLASS zcl_01_bankdetails IMPLEMENTATION.

  METHOD depositmoney.
    lv_totaldepo += iv_money.
  ENDMETHOD.

  METHOD getbankbalance.
    result = lv_totaldepo.
  ENDMETHOD.

  METHOD withdrowmoney.
    lv_totaldepo -= iv_money.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    "Deposit Money
    depositmoney( iv_money = 30 ).
    depositmoney( iv_money = 100 ).
    withdrowmoney( iv_money = 10 ).

    DATA(t1) = getbankbalance(  ).
    out->write( t1 ).
  ENDMETHOD.


ENDCLASS.
