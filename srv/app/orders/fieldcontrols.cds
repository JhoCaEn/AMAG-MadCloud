using AppOrdersService as service from '.';

annotate service.Orders with {
    salesPartner                               @Core.Immutable;
    dealerPartner                              @Core.Immutable;
    soldToPartner                              @Core.Computed;
    shipToPartner                              @Core.Computed;
    billToPartner                              @Core.Computed;
    paidByPartner                              @Core.Computed;
    brand                                      @Core.Immutable;
    model                                      @Core.Immutable;
    modelSalesPriceValue                       @readonly;
    modelSalesPriceCurrency                    @readonly;
    exteriorColor                              @Core.Immutable;
    exteriorColorSalesPriceConstraintEquipment @Core.Immutable;
    exteriorColorSalesPriceConstraintColor     @Core.Immutable;
    exteriorColorSalesPriceValue               @readonly;
    exteriorColorSalesPriceCurrency            @readonly;
    interiorColor                              @Core.Immutable;
    interiorColorSalesPriceConstraintEquipment @Core.Immutable;
    interiorColorSalesPriceConstraintColor     @Core.Immutable;
    interiorColorSalesPriceValue               @readonly;
    interiorColorSalesPriceCurrency            @readonly;
    roofColor                                  @Core.Immutable;
    roofColorSalesPriceConstraintEquipment     @Core.Immutable;
    roofColorSalesPriceConstraintColor         @Core.Immutable;
    roofColorSalesPriceValue                   @readonly;
    roofColorSalesPriceCurrency                @readonly;
    usage                                      @Core.Computed;
    availability                               @Core.Computed;
    customerState                              @Core.Computed;
    endCustomerState                           @Core.Computed;
    orderType                                  @Core.Computed;
    deliveryCode                               @Core.Computed;
    configuredAt                               @Core.Immutable;
// seller                                     @Core.Computed;
// customsClearance                           @Core.Computed;
// customerProject                            @Core.Computed;
// fleetActive                                @Core.Computed;
// fleetCompany                               @Core.Computed;
// fleetProject                               @Core.Computed;
// mediatorActive                             @Core.Computed;
// mediatorName                               @Core.Computed;
// mediatorLocation                           @Core.Computed;
// employeeId                                 @Core.Computed;
// employeeVoucher                            @Core.Computed;
};
