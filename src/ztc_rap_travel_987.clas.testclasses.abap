"!@testing ZI_RAP_TRAVEL_987
CLASS ltc_ZI_RAP_TRAVEL_987
DEFINITION FINAL FOR TESTING
DURATION SHORT
RISK LEVEL HARMLESS.
  PRIVATE SECTION.

    CLASS-DATA:
      environment TYPE REF TO if_cds_test_environment.

    CLASS-METHODS:
      "! In CLASS_SETUP, corresponding doubles and clone(s) for the CDS view under test and its dependencies are created.
      class_setup RAISING cx_static_check,
      "! In CLASS_TEARDOWN, Generated database entities (doubles & clones) should be deleted at the end of test class execution.
      class_teardown.

    DATA:
      act_results       TYPE STANDARD TABLE OF zi_rap_travel_987 WITH EMPTY KEY,
      lt_zrap_atrav_987 TYPE STANDARD TABLE OF zrap_atrav_987 WITH EMPTY KEY.

    METHODS:
      "! SETUP method creates a common start state for each test method,
      "! clear_doubles clears the test data for all the doubles used in the test method before each test method execution.
      setup RAISING cx_static_check,
      prepare_testdata_set,
      "!  In this method test data is inserted into the generated double(s) and the test is executed and
      "!  the results should be asserted with the actuals.
      first FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltc_ZI_RAP_TRAVEL_987 IMPLEMENTATION.

  METHOD class_setup.
    environment = cl_cds_test_environment=>create( i_for_entity = 'ZI_RAP_TRAVEL_987' ).
  ENDMETHOD.

  METHOD setup.
    environment->clear_doubles( ).
  ENDMETHOD.

  METHOD class_teardown.
    environment->destroy( ).
  ENDMETHOD.

  METHOD first.
    prepare_testdata_set( ).

    SELECT * FROM zi_rap_travel_987
    WHERE customerid = '1001'
        INTO TABLE @act_results.

    cl_abap_unit_assert=>assert_equals(
        act                  = act_results[  CustomerID = '1001' ]-agencyid
        exp                  = '4711'
    ).


*    cl_abap_unit_assert=>fail( msg = 'Place your assertions here' ).
  ENDMETHOD.

  METHOD prepare_testdata_set.

    "Prepare test data for 'zrap_atrav_987'
    lt_zrap_atrav_987 = VALUE #(
      (
        client = sy-mandt
        customer_id = '1001'
        agency_id = '4711'




      ) ).
    environment->insert_test_data( i_data =  lt_zrap_atrav_987 ).

  ENDMETHOD.

ENDCLASS.
