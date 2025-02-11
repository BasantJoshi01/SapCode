CLASS zcl_class_cat_bj DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zcl_class_animal_bj.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_class_cat_bj IMPLEMENTATION.

  METHOD zcl_class_animal_bj~eatfood.

    return = 'Cat is Eating Food'.

  ENDMETHOD.

  METHOD zcl_class_animal_bj~makesound.
    return = 'meaaoo'.
  ENDMETHOD.

ENDCLASS.
