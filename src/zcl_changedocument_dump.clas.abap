CLASS zcl_changedocument_dump DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_changedocument_dump IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


*    METHOD save_modified.
*
*  DATA : ls_old_data   TYPE ztm_header_11562,
*         ls_new_data   TYPE ztm_header_11562,
*         lt_new_data   TYPE STANDARD TABLE OF ztm_header_11562,
*         lt_new        TYPE STANDARD TABLE OF ztm_header_11562,
*         lt_old_data   TYPE STANDARD TABLE OF ztm_header_11562,
*         docno         TYPE z_doc_number.
*
*  DATA:lt_txt_header   TYPE if_chdo_object_tools_rel=>ty_cdtxt_tab,
*       ls_txt_header   TYPE if_chdo_object_tools_rel=>ty_cdtxt_line.
*
*  DATA upd_txt_doc     TYPE if_chdo_object_tools_rel=>ty_cdchngindh.
*  DATA upd_doc         TYPE if_chdo_object_tools_rel=>ty_cdchngindh.
*  DATA changenumber    TYPE if_chdo_object_tools_rel=>ty_cdchangenr.
*  DATA:objectid        TYPE if_chdo_object_tools_rel=>ty_cdobjectv,
*       utime           TYPE if_chdo_object_tools_rel=>ty_cduzeit,
*       udate           TYPE if_chdo_object_tools_rel=>ty_cddatum,
*       username        TYPE if_chdo_object_tools_rel=>ty_cdusername,
*       cdoc_upd_object TYPE if_chdo_object_tools_rel=>ty_cdchngindh VALUE 'I'.
*
*
*  DATA:lt_txt_doc      TYPE if_chdo_object_tools_rel=>ty_cdtxt_tab,
*       ls_txt_doc      LIKE LINE OF lt_txt_doc.
*
*  DATA dref_emp        TYPE REF TO data.
*  DATA:lcl_table       TYPE REF TO cl_abap_tabledescr,
*       lcl_struc       TYPE REF TO cl_abap_structdescr,
*       it_fields       TYPE abap_compdescr_tab.
*
*       FIELD-SYMBOLS: <itab> TYPE any.
*
*       CREATE DATA dref_emp TYPE STANDARD TABLE OF ztm_header_11562.
*
*       TRY.
*        username = cl_abap_context_info=>get_user_technical_name( ). "get_user_description(  ).
*        utime = cl_abap_context_info=>get_system_time(  ).
*        udate = cl_abap_context_info=>get_system_date(  ).
*      CATCH cx_abap_context_info_error.
*        "handle exception
*    ENDTRY.
*
*    IF create-ZTMI_HEADER_11562 IS NOT INITIAL.
*
*    lt_new_data = CORRESPONDING  #( create-ZTMI_HEADER_11562 MAPPING FROM ENTITY ).
*      READ TABLE lt_new_data ASSIGNING FIELD-SYMBOL(<fs_create>) INDEX 1.
*
*      objectid = <fs_create>-docno.
*      <fs_create>-client = sy-mandt.
*      CONDENSE objectid.
*
*       upd_doc = 'I'.
*      upd_txt_doc = 'I'.
*
*      ls_txt_doc-teilobjid = objectid.
*      ls_txt_doc-textart = 'CHAR'.
*      ls_txt_doc-textspr = 'E'.
*      ls_txt_doc-updkz = 'I'.
*
*      APPEND ls_txt_doc TO lt_txt_doc.
*      CLEAR:ls_txt_doc.
*
*      TRY.
*
*          zcl_ztm_header_cd_chdo=>write(
*          EXPORTING
*
*                    objectid                = objectid
*                    utime                   = utime
*                    udate                   = udate
*                    username                = username
*                    object_change_indicator = cdoc_upd_object
*                    planned_or_real_changes = 'R'
*                    o_ztm_header_11562         = ls_old_data
*                    n_ztm_header_11562        = <fs_create>
*                    upd_ztm_header_11562        = upd_doc
*                  IMPORTING
*                    changenumber            = changenumber
*           ).
*           CATCH cx_chdo_write_error INTO DATA(lx_root).
*
*          DATA(lv_tesxt) =  |Exception occurred: { lx_root->get_text( ) }|.
*
*      ENDTRY.
*
*      ELSEIF update-ZTMI_HEADER_11562 IS NOT INITIAL.
*
*      lt_new = CORRESPONDING  #( update-ZTMI_HEADER_11562 MAPPING FROM ENTITY ).
*      READ TABLE lt_new ASSIGNING FIELD-SYMBOL(<fs_update>) INDEX 1.
*
*      DATA(lv_docno) = <fs_update>-docno.
*
*      ASSIGN dref_emp->* TO <itab>.
** Get the Table details
*      lcl_table ?= cl_abap_typedescr=>describe_by_data( <itab> ).
** Get the table line type i.e., structure details
*      lcl_struc ?= lcl_table->get_table_line_type( ).
** Get the components(fields) of the table line
*      it_fields = lcl_struc->components.
*      DATA: lv_fieldname TYPE string.
*      DATA st_var TYPE string.
*      LOOP AT update-ZTMI_HEADER_11562 ASSIGNING FIELD-SYMBOL(<fs_header>).
*
*        LOOP AT it_fields INTO DATA(ls_compnents).
*
*          lv_fieldname = ls_compnents-name.
*
*          ASSIGN COMPONENT lv_fieldname OF STRUCTURE <fs_header>-%control TO FIELD-SYMBOL(<lv_control_value>).
*          IF ls_compnents-name EQ 'CLIENT'.
*            CONTINUE.
*          ENDIF.
*          IF <lv_control_value> = '01'.
*
*            IF st_var IS NOT INITIAL.
*
*              st_var = |{ st_var }, { ls_compnents-name }|.
*            ENDIF.
*
*          ELSE.
*            CONTINUE.
*
*          ENDIF.
*        ENDLOOP.
*
*      ENDLOOP.
*      SELECT (st_var) FROM @lt_new AS lt_new WHERE docno = @lv_docno INTO TABLE @lt_new_data.
*
*      SELECT (st_var) FROM ztm_header_11562 WHERE docno = @lv_docno INTO TABLE @lt_old_data.
*
*      ls_old_data = lt_old_data[ 1 ].
*      ls_new_data = lt_new_data[ 1 ].
*
*      objectid = <fs_update>-docno.
*      CONDENSE Objectid.
*
*      upd_doc = 'U'.
*      upd_txt_doc = 'U'.
*
*      ls_txt_doc-teilobjid = objectid.
*      ls_txt_doc-textart = 'CHAR'.
*      ls_txt_doc-textspr = 'E'.
*      ls_txt_doc-updkz = 'U'.
*
*      APPEND ls_txt_doc TO lt_txt_doc.
*      CLEAR:ls_txt_doc.
*
*      TRY.
*
*          zcl_ztm_header_cd_chdo=>write(
*          EXPORTING
*                    objectid                = objectid
*                    utime                   = utime
*                    udate                   = udate
*                    username                = username
*                    object_change_indicator = cdoc_upd_object
*                    planned_or_real_changes = 'R'
*                    o_ztm_header_11562         = ls_old_data
*                    n_ztm_header_11562         = ls_new_data
*                    upd_ztm_header_11562       = upd_doc
*                  IMPORTING
*                    changenumber            = changenumber
*           ).
*        CATCH cx_chdo_write_error.
*      ENDTRY.
*
*
*    ENDIF.
*
*  ENDMETHOD.
*
*CLASS zcl_changedoc DEFINITION
*  PUBLIC
*  FINAL
*  CREATE PUBLIC .
*
*  PUBLIC SECTION.
*
*    INTERFACES if_rap_query_provider .
*  PROTECTED SECTION.
*  PRIVATE SECTION.
*ENDCLASS.
*
*
*
*CLASS zcl_changedoc IMPLEMENTATION.
*
*
*  METHOD if_rap_query_provider~select.
*  DATA: lt_change_doc TYPE TABLE OF ZTMI_READ_CD_HEADER,
*          ls_change_doc TYPE ZTMI_READ_CD_HEADER.
*
*    DATA: rt_cdredadd TYPE cl_chdo_read_tools=>tt_cdredadd_tab,
*          lr_err      TYPE REF TO cx_chdo_read_error.
*
*    DATA: lt_objectid TYPE TABLE OF cl_chdo_read_tools=>ty_r_objectid_line,
*          ls_objectid TYPE cl_chdo_read_tools=>ty_r_objectid_line.
*
*    DATA : lv_objclass TYPE if_chdo_object_tools_rel=>ty_cdobjectcl,
*           lv_objectid TYPE STANDARD TABLE OF cl_chdo_read_tools=>ty_r_objectid_line.
*
*             TRY.
*
*        io_request->is_data_requested( ).
*        DATA(entityid)     = io_request->get_entity_id( ).
*        DATA(lv_top)       = io_request->get_paging( )->get_page_size( ).
*        DATA(lv_skip)      = io_request->get_paging( )->get_offset( ).
*        DATA(lt_fields)    = io_request->get_requested_elements( ).
*        DATA(lt_sort)      = io_request->get_sort_elements( ).
*        DATA(lv_page_size) = io_request->get_paging( )->get_page_size( ).
*        DATA(lv_max_rows)  = COND #( WHEN lv_page_size = if_rap_query_paging=>page_size_unlimited THEN 0 ELSE lv_page_size ).
*
*        DATA(lt_condition) =  io_request->get_filter( )->get_as_ranges( iv_drop_null_comparisons = abap_true ).
*        SORT lt_condition BY name ASCENDING.
*
*          READ TABLE lt_condition WITH KEY name = 'OBJECTCLASS' INTO DATA(ls_objcls_key) BINARY SEARCH.
*        IF sy-subrc = 0.
*          LOOP AT ls_objcls_key-range INTO DATA(ls_objcls_option).
*            IF ls_objcls_option-low IS NOT INITIAL.
*              CLEAR lv_objclass.
*              lv_objclass = ls_objcls_option-low.
*            ENDIF.
*          ENDLOOP.
*        ENDIF.
*
****FETCHING THE OBJECTID FROM FILTER
*        READ TABLE lt_condition WITH KEY name = 'OBJECTID' INTO DATA(ls_objectid_key) BINARY SEARCH.
*        IF sy-subrc = 0.
*          LOOP AT ls_objectid_key-range INTO DATA(ls_objectid_option).
*            IF ls_objectid_option-low IS NOT INITIAL.
*              CLEAR ls_objectid.
*              ls_objectid-sign = ls_objectid_option-sign.
*              ls_objectid-option = ls_objectid_option-option.
*              ls_objectid-low = ls_objectid_option-low.
*              ls_objectid-high = ls_objectid_option-high.
*              APPEND ls_objectid TO lt_objectid.
*              CLEAR ls_objectid.
*            ENDIF.
*
*          ENDLOOP.
*        ENDIF.
*
****GETTING THE CHANGE DOCUMENT
*        TRY.
*            cl_chdo_read_tools=>changedocument_read(
*                 EXPORTING
*                  i_objectclass    = lv_objclass  " change document object name
*                  it_objectid      = lt_objectid
*                 IMPORTING
*                   et_cdredadd_tab  = rt_cdredadd    " result returned in table
*               ).
*          CATCH cx_chdo_read_error INTO lr_err.
*        ENDTRY.
*
**        Delete ADJACENT DUPLICATES FROM rt_cdredadd COMPARING changenr.
*
*        lt_change_doc = CORRESPONDING #( rt_cdredadd ).
*
****setting the OUTPUT NUMBER OF records
*            io_response->set_total_number_of_records( lines( lt_change_doc ) ).
****SETTING THE OUTPUT INTERNAL TABLE
*        io_response->set_data( lt_change_doc ).
*
*      CATCH cx_root INTO DATA(lx_root).
*        DATA(lv_text) = lx_root->get_text(  ).
*    ENDTRY.
*
*  ENDMETHOD.
*ENDCLASS.
*
  ENDMETHOD.





ENDCLASS.
