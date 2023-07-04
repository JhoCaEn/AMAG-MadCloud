using AppOffersService as service from '../../../../srv';

annotate service.Offers with {
    ID                            @UI.Hidden;
    ocd                           @Core.Computed;
    customerProjectName           @Core.Computed;
    customerProjectNumber         @Core.Computed;
    fleetProjectNumber            @Core.Computed;
    fleetProjectCompanyNumber     @Core.Computed;
    createdBySalesSystem          @Core.Computed;
    salesPartner                  @Core.Computed;
    salesPartner                  @Common: {
        Text           : salesPartner.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };
    brand                         @Core.Computed;
    brand                         @Common: {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
    carConfigurationID            @Core.Computed;
    carConfigurationIsValid       @Core.Computed;
    carConfigurationConfiguredAt  @Core.Computed;
    carConfigurationModel         @Core.Computed;
    carConfigurationModel         @Common: {
        Text           : carConfigurationModel.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };
    carConfigurationExteriorColor @Core.Computed;
    carConfigurationExteriorColor @Common: {
        Text           : carConfigurationExteriorColor.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };
    carConfigurationInteriorColor @Core.Computed;
    carConfigurationInteriorColor @Common: {
        Text           : carConfigurationInteriorColor.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };
    carConfigurationRoofColor     @Core.Computed;
    carConfigurationRoofColor     @Common: {
        Text           : carConfigurationRoofColor.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };
    hasSalesPartner             @Core.Computed;
};

annotate service.SalesPartners with {
    id @Common: {
        Text           : name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };
};
