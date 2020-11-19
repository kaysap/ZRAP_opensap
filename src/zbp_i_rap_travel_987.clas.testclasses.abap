*"* use this source file for your ABAP unit test classes
CLASS ltd_travel_behavior DEFINITION FINAL FOR TESTING.
  PUBLIC SECTION.
    INTERFACES if_abap_behavior_testdouble .

    METHODS constructor.
ENDCLASS.

CLASS ltd_travel_behavior IMPLEMENTATION.
  METHOD constructor.
    if_abap_behavior_testdouble~root_name = 'Travel'.
  ENDMETHOD.
  METHOD if_abap_behavior_testdouble~get_features.
    CHECK 1 = 2.
  ENDMETHOD.

ENDCLASS.


CLASS ltc_travel_behavior DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.


  PRIVATE SECTION.
    CLASS-DATA:
      mo_behv_td           TYPE REF TO   if_abap_behavior_testdouble,
      cds_test_environment TYPE REF TO if_cds_test_environment.

    CLASS-METHODS:
      class_setup,
      class_teardown.
    METHODS:
      setup,
      teardown.
    METHODS:
      first_test FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltc_travel_behavior IMPLEMENTATION.

  METHOD class_setup.
    mo_behv_td = NEW ltd_travel_behavior( ).
    cl_abap_behv_test_environment=>set_test_double( object = mo_behv_td ).



    cds_test_environment = cl_cds_test_environment=>create_for_multiple_cds(
        i_for_entities = VALUE #( ( i_for_entity = 'zi_rap_travel_987' )
                                  ( i_for_entity = 'zi_rap_booking_987' ) )
                                ).
  ENDMETHOD.

  METHOD class_teardown.
    cds_test_environment->destroy( ).
  ENDMETHOD.

  METHOD setup.
  ENDMETHOD.

  METHOD teardown.
    ROLLBACK ENTITIES.
    cds_test_environment->clear_doubles( ).
  ENDMETHOD.

  METHOD first_test.

    DATA lt_failed  TYPE RESPONSE FOR FAILED EARLY zi_rap_travel_987.
    DATA lt_reported  TYPE RESPONSE FOR REPORTED EARLY zi_rap_travel_987.

    "???
    mo_behv_td->get_features(
       EXPORTING
         features = VALUE #( )
       CHANGING
         failed   = lt_failed
         reported =  lt_reported
     ).
    cl_abap_unit_assert=>assert_not_initial( lt_failed ).
*    cl_abap_unit_assert=>assert_equals(  act = '' exp = 'X' ).
  ENDMETHOD.

ENDCLASS.
