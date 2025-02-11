INTERFACE zcl_class_animal_bj
  PUBLIC .

  METHODS : MakeSound
    RETURNING VALUE(return) TYPE string,
    EatFood RETURNING VALUE(return) TYPE string.

ENDINTERFACE.
