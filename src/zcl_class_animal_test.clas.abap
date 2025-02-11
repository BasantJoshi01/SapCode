CLASS zcl_class_animal_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
  data : animal type ref to zcl_class_animal_bj.
  "DATA : warn type ref to zcl_class_dog_bj.

ENDCLASS.



CLASS zcl_class_animal_test IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* To access method3(), you need to cast the interface reference to the specific
* class type that contains the method. Here's how you can do it:

  data(warn) = new zcl_class_dog_bj(  ).

  " converting animal to instance of a class using casting

  animal = warn.
  if animal is INSTANCE OF zcl_class_dog_bj .
   out->write( warn->protected(  ) ).
  ENDIF.



  animal = new zcl_class_dog_bj(  ).

  out->write( animal->eatfood(  ) ).
  out->write( animal->makesound(  ) ).

  animal = new zcl_class_cat_bj(  ).
  out->write( animal->eatfood(  ) ).
  out->write( animal->makesound(  ) ).

*  data(warn) = new zcl_class_dog( ).
*
*  out->write( warn->protect(  ) ).




  ENDMETHOD.
ENDCLASS.
