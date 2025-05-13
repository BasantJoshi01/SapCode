CLASS ztravel_fill_data_bas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.


  PRIVATE SECTION.
ENDCLASS.


CLASS ztravel_fill_data_bas IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    INSERT ztravel_bas FROM
      ( SELECT
          travel_id,
          total_price,
          currency_code,
          description,
          CASE
            WHEN total_price > 4500 THEN 'Business'
            WHEN total_price > 3000 THEN 'Premium Economy'
            ELSE 'Economy'
          END AS travel_type_zbj
        FROM /dmo/travel
      ).








  ENDMETHOD.
ENDCLASS.
