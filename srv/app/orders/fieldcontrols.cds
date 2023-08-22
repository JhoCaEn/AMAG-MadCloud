using AppOrdersService as service from '.';

annotate service.Orders with {
    configuredAt                               @Core.Immutable;
    configuredAt                               @mandatory;
    salesPartner                               @Core.Immutable;
    salesPartner                               @mandatory;
    brand                                      @Core.Immutable;
    brand                                      @mandatory;
    model                                      @Core.Immutable;
    model                                      @mandatory;
    interiorColor                              @Core.Computed;
    exteriorColor                              @Core.Computed;
    roofColor                                  @Core.Computed;
    exteriorColorSalesPriceConstraintEquipment @Core.Computed;
    exteriorColorSalesPriceConstraintColor     @Core.Computed;
    interiorColorSalesPriceConstraintEquipment @Core.Computed;
    interiorColorSalesPriceConstraintColor     @Core.Computed;
    roofColorSalesPriceConstraintEquipment     @Core.Computed;
    roofColorSalesPriceConstraintColor         @Core.Computed;
};
