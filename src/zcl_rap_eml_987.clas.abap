CLASS zcl_rap_eml_987 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RAP_EML_987 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


*    " step 1 - READ (key only)
*    READ ENTITIES OF zi_rap_travel_987
*     ENTITY Travel
*      FROM VALUE #( ( TravelUUID = '02160C5207821EEB87EEA8B204487438' ) )
*      RESULT DATA(travels).
*
*    out->write(  travels ).

*    " step 2 - READ with Fields
*    READ ENTITIES OF ZI_RAP_Travel_987
*      ENTITY travel
*        FIELDS ( AgencyID CustomerID )
*      WITH VALUE #( ( TravelUUID = '02160C5207821EEB87EEA8B204487438' ) )
*      RESULT DATA(travels).
*    out->write( travels ).


    " step 3 - READ with All Fields
    READ ENTITIES OF ZI_RAP_Travel_987
      ENTITY travel
        ALL FIELDS
      WITH VALUE #( ( TravelUUID = '02160C5207821EEB87EEA8B204487438' ) )
      RESULT DATA(travels).

    out->write( travels ).

    " step 4 - READ By Association
    READ ENTITIES OF ZI_RAP_Travel_987
      ENTITY travel BY \_Booking
        ALL FIELDS WITH VALUE #( ( TravelUUID = '02160C5207821EEB87EEA8B204487438' ) )
      RESULT DATA(bookings).

    out->write( bookings ).

*    " step 5 - Unsuccessful READ
*    READ ENTITIES OF ZI_RAP_Travel_987
*      ENTITY travel
*        ALL FIELDS WITH VALUE #( ( TravelUUID = '11111111111111111111111111111111' ) )
*      RESULT DATA(travels)
*      FAILED DATA(failed)
*      REPORTED DATA(reported).
*
*    out->write( travels ).
*    out->write( failed ).    " complex structures not supported by the console output
*    out->write( reported ).  " complex structures not supported by the console output


*    " step 6 - MODIFY Update
*    MODIFY ENTITIES OF ZI_RAP_Travel_987
*      ENTITY travel
*        UPDATE
*          SET FIELDS WITH VALUE
*            #( ( TravelUUID  = '02160C5207821EEB87EEA8B204487438'
*                 Description = 'I like RAP@openSAP' ) )
*
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    out->write( 'Update done' ).
*
*    " step 6b - Commit Entities
*    COMMIT ENTITIES
*      RESPONSE OF ZI_RAP_Travel_987
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).


*    " step 7 - MODIFY Create
*    MODIFY ENTITIES OF ZI_RAP_Travel_987
*      ENTITY travel
*        CREATE
*          SET FIELDS WITH VALUE
*            #( ( %cid        = 'MyContentID_1'
*                 AgencyID    = '70013'
*                 CustomerID  = '38'
*                 CurrencyCode = 'EUR'
*                 BeginDate   = cl_abap_context_info=>get_system_date( )
*                 EndDate     = cl_abap_context_info=>get_system_date( ) + 10
*                 Description = 'I like RAP@openSAP' ) )
*
*     MAPPED DATA(mapped)
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    out->write( mapped-travel ).
*
*    COMMIT ENTITIES
*      RESPONSE OF ZI_RAP_Travel_987
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Create done' ).
*


    " step 8 - MODIFY Delete
    MODIFY ENTITIES OF ZI_RAP_Travel_987
      ENTITY travel
        DELETE FROM
          VALUE
            #( ( TravelUUID  = '02DAC0EC08C01EEB87EF59B310AB57D5' ) )

     FAILED DATA(failed)
     REPORTED DATA(reported).

    COMMIT ENTITIES
      RESPONSE OF ZI_RAP_Travel_987
      FAILED     DATA(failed_commit)
      REPORTED   DATA(reported_commit).

    out->write( 'Delete done' ).

  ENDMETHOD.
ENDCLASS.
