using AppOrdersService as service from '.';

annotate service.Orders with {
    brand                                      @Core.Immutable;
    brand                                      @mandatory;
    salesOrganisation                          @Core.Immutable;
    salesOrganisation                          @mandatory;
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
