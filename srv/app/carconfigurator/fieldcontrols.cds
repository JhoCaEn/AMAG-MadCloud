using AppCarConfiguratorService as service from '.';

annotate service.Configurations with {
    configuredAt                @Core.Immutable;
    partner                     @Core.Immutable;
    partner                     @mandatory;
    brand                       @Core.Immutable;
    brand                       @mandatory;
    salesOrganisation           @Core.Immutable;
    salesOrganisation           @mandatory;
    isNewConfiguration          @Core.Immutable;
    isPrepared                  @Core.Computed;
    model                       @Core.Computed;
    hasSelectableExteriorColors @Core.Computed;
    hasSelectableInteriorColors @Core.Computed;
    hasSelectableRoofColors     @Core.Computed;
    exteriorColor               @Core.Computed;
    interiorColor               @Core.Computed;
    roofColor                   @Core.Computed;
    hasValidColorCombination    @Core.Computed;
    preselectedModel            @Core.Computed;
    preselectedExteriorColor    @Core.Computed;
    preselectedInteriorColor    @Core.Computed;
    preselectedRoofColor        @Core.Computed;
    callback                    @readonly;
};