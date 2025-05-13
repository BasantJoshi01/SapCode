CLASS zcl_convtojson DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    METHODS get_sample_json
      RETURNING
        VALUE(r_result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_convtojson IMPLEMENTATION.

  METHOD get_sample_json.

    DATA : sample_json TYPE string.

    sample_json =
    '{' &&
  '"text": "Sample Text",' &&
  '"number_integer": 123,' &&
  '"number_decimal": 456.78,' &&
  '"boolean": true,' &&
  '"array_element": [' &&
  '  {' &&
  '    "text2": "Element A",' &&
  '    "number2": 1' &&
  '  },' &&
  '  {' &&
  '    "text2": "Element B",' &&
  '    "number2": 2' &&
  '  }' &&
  '],' &&
  '"array_data": [' &&
  '  "Data1",' &&
  '  "Data2",' &&
  '  "Data3"' &&
  '],' &&
  '"dynamic_list": {' &&
  '  "Key1": "Value1",' &&
  '  "Key2": "Value2",' &&
  '  "Key3": "Value3"' &&
  '}' &&
  '}'.

    r_result = sample_json.

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.



*    TYPES: BEGIN OF ty_scope_item,
*             products TYPE string,
*           END OF ty_scope_item,
*
*           " -- Table creation of a structure
*
*           ty_scope TYPE STANDARD TABLE OF ty_scope_item WITH EMPTY KEY,
*
*           BEGIN OF ty_header,
*             version TYPE string,
*             scope   TYPE ty_scope,
*           END OF ty_header,
*
*           ty_headers TYPE STANDARD TABLE OF ty_header WITH EMPTY KEY.
*
*    DATA(headers) = VALUE ty_headers( ( version = '2025-26' scope = VALUE #( ( products = 'dynamic' ) ) ) ).
*
*    DATA(json) = /ui2/cl_json=>serialize(
*
*           data             = headers
*           compress         = abap_true
*           assoc_arrays     = abap_true
*           assoc_arrays_opt = abap_true
*           pretty_name =  /ui2/cl_json=>pretty_mode-camel_case
*
*       ).
*
*    out->write( json ).

    "----Deserialization


    "     Object = {}  ===> Structure
*    array = [ {} , {} ] = internal table with structure
*    array = [ a , b, c ] = internal table with simple type



    TYPES td_decimal TYPE p LENGTH 16 DECIMALS 2.
    TYPES td_char    TYPE c LENGTH 10.

    TYPES: BEGIN OF ts_element,
             text2   TYPE string,
             number2 TYPE i,
           END OF ts_element.

    TYPES tt_element TYPE STANDARD TABLE OF ts_element WITH EMPTY KEY.  " Array of objects

    TYPES tt_data    TYPE STANDARD TABLE OF td_char WITH EMPTY KEY. " array if character

    TYPES: BEGIN OF ts_dummy_data,
             text           TYPE string,
             number_integer TYPE i,
             number_decimal TYPE td_decimal,
             boolean        TYPE abap_bool,
             array_element  TYPE tt_element,
             array_data     TYPE tt_data,
             dynamic_list   TYPE REF TO data,
           END OF ts_dummy_data.

    " ABAP to JSON
    TYPES: BEGIN OF ts_internal,
             camel_string TYPE string,
             singlestring TYPE string,
             camel_number TYPE td_decimal,
             singlenumber TYPE td_decimal,
             camel_int    TYPE i,
             singleint    TYPE i,
             camel_bool   TYPE abap_bool,
             singlebool   TYPE abap_bool,
           END OF ts_internal.

    types tt_internal TYPE STANDARD TABLE OF ts_internal WITH EMPTY KEY.

    DATA ls_dummy TYPE ts_dummy_data.

    DATA ld_json TYPE string.

    ld_json = get_sample_json(  ).

    /UI2/CL_JSON=>deserialize(
      EXPORTING
        json = ld_json
      CHANGING
        data = ls_dummy
    ).
    out->write( ls_dummy ).

    " ABAP to JSON

   DATA(lt_internal) = VALUE tt_internal(
  ( camel_string = 'First Entry'
    singlestring = 'Single1'
    camel_number = '100.50'
    singlenumber = '200.75'
    camel_int    = 10
    singleint    = 20
    camel_bool   = abap_true
    singlebool   = abap_false )
  ( camel_string = 'Second Entry'
    singlestring = 'Single2'
    camel_number = '300.25'
    singlenumber = '400.60'
    camel_int    = 30
    singleint    = 40
    camel_bool   = abap_false
    singlebool   = abap_true )
  ( camel_string = 'Third Entry'
    singlestring = 'Single3'
    camel_number = '500.00'
    singlenumber = '600.80'
    camel_int    = 50
    singleint    = 60
    camel_bool   = abap_true
    singlebool   = abap_true )
).

    DATA(lv_json) = /ui2/cl_json=>serialize(
      EXPORTING
        data             = lt_internal
        format_output   = abap_true
        pretty_name     = /ui2/cl_json=>pretty_mode-camel_case

    ).

    out->write( lv_json ).



  ENDMETHOD.




ENDCLASS.
