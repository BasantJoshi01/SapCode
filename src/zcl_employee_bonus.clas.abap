CLASS zcl_employee_bonus DEFINITION ABSTRACT
  PUBLIC
  CREATE PUBLIC .
  PUBLIC SECTION.

      METHODS : EmpValidation
             IMPORTING EMPID TYPE I
            RETURNING VALUE(return) type abap_bool.

      METHODS : BonusRate ABSTRACT
               IMPORTING NumberOfDays type i
                         PerformanceScore type i
               RETURNING VALUE(return) type i.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_employee_bonus IMPLEMENTATION.


  METHOD empvalidation.

    if empid is NOT INITIAL.

    RETURN abap_true.

    else.
    return abap_false.

    ENDIF.

  ENDMETHOD.



ENDCLASS.
