using AppOffersService as service from '.';

annotate service.Offers with {
    ocd                           @Core.Computed;
    customerProjectName           @Core.Computed;
    customerProjectNumber         @Core.Computed;
    fleetProjectNumber            @Core.Computed;
    fleetProjectCompanyNumber     @Core.Computed;
    createdBySalesSystem          @Core.Computed;
    salesPartner                  @Core.Computed;
    brand                         @Core.Computed;
    carConfigurationID            @Core.Computed;
    carConfigurationIsValid       @Core.Computed;
    carConfigurationConfiguredAt  @Core.Computed;
    carConfigurationModel         @Core.Computed;
    carConfigurationExteriorColor @Core.Computed;
    carConfigurationInteriorColor @Core.Computed;
    carConfigurationRoofColor     @Core.Computed;
    hasSalesPartner               @Core.Computed;
    callback                      @readonly;
};
