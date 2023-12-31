using AppOffersService as service from '.';

annotate service.Offers with {
    ocd                                                        @Core.Computed;
    projectCustomerName                                        @Core.Computed;
    customerProjectNumber                                      @Core.Computed;
    fleetProjectNumber                                         @Core.Computed;
    fleetCompanyNumber                                  @Core.Computed;
    createdBySalesSystem                                       @Core.Computed;
    salesPartner                                               @Core.Computed;
    brand                                                      @Core.Computed;
    carConfigurationID                                         @Core.Computed;
    carConfigurationIsValid                                    @Core.Computed;
    configuredAt                               @Core.Computed;
    model                                      @Core.Computed;
    exteriorColor                              @Core.Computed;
    exteriorColorSalesPriceConstraintEquipment @Core.Computed;
    exteriorColorSalesPriceConstraintColor     @Core.Computed;
    interiorColor                              @Core.Computed;
    interiorColorSalesPriceConstraintEquipment @Core.Computed;
    interiorColorSalesPriceConstraintColor     @Core.Computed;
    roofColor                                  @Core.Computed;
    roofColorSalesPriceConstraintEquipment     @Core.Computed;
    roofColorSalesPriceConstraintColor         @Core.Computed;
    hasSalesPartner                                            @Core.Computed;
    callback                                                   @readonly;
    exteriorColorSalesPriceValue               @Core.Computed;
    interiorColorSalesPriceValue               @Core.Computed;
    roofColorSalesPriceValue                   @Core.Computed;
    modelSalesPriceValue                       @Core.Computed;
};
