CLASS zcl_class_dog_bj DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zcl_class_animal_bj.
     METHODS Protected
          RETURNING VALUE(result) TYPE string.
  PROTECTED SECTION.



  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_class_dog_bj IMPLEMENTATION.


  METHOD zcl_class_animal_bj~eatfood.

  return = 'Dog is Eating Food'.

  ENDMETHOD.

  METHOD zcl_class_animal_bj~makesound.
        return = 'Woof'.
  ENDMETHOD.

  METHOD Protected.
    result = 'Dog has bitten Stanger'.
  ENDMETHOD.

ENDCLASS.
