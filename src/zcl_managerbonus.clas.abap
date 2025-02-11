CLASS zcl_managerbonus DEFINITION  INHERITING FROM zcl_employee_bonus
  PUBLIC



  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  METHODS : BonusRate REDEFINITION.


  PROTECTED SECTION.
  PRIVATE SECTION.
  data : discount type P  LENGTH 2 DECIMALS 2.
ENDCLASS.



CLASS zcl_managerbonus IMPLEMENTATION.


  METHOD bonusrate.

    discount = '00.15'.

    if numberofdays > 365.

        return = performancescore * discount.

    ENDIF.


  ENDMETHOD.

ENDCLASS.
