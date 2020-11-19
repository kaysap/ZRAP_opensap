
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Travel BO projection view'
@Metadata.allowExtensions: true
@Search.searchable: true
 
define root view entity ZC_RAP_Travel_987 
as projection on ZI_RAP_Travel_987 as Travel {
    //ZI_RAP_TRAVEL_987
    key TravelUUID,
    @Search.defaultSearchElement: true
    TravelID,
   // @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency', element: 'AgencyID' } }]
    @Consumption.valueHelpDefinition: [{ entity: { name: 'zce_rap_agency_987', element: 'AgencyId' } }]
    // @ObjectModel.text.element: ['AgencyName']
    @Search.defaultSearchElement: true
    AgencyID,
    // _Agency.Name as AgencyName,
    @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID' } }]
    @ObjectModel.text.element: ['CustomerName']
    @Search.defaultSearchElement: true
    CustomerID,
    _Customer.LastName as CustomerName,
    BeginDate,
    EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    @Consumption.valueHelpDefinition: [{ entity: { name: 'i_currency', element: 'Currency' } }]
    CurrencyCode,
    Description,
    TravelStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    //ZI_RAP_TRAVEL_987
    _Agency,
    _Booking: redirected to composition child ZC_RAP_Booking_987,
    _Currency,
    _Customer
}
