using {retail.dwb as db} from '../../../db';

annotate db.Offers with {
    ID                                                         @title: '{i18n>General.ID}';
    ocd                                                        @title: '{i18n>Offers.ocd}';
    projectType                                                @title: '{i18n>ProjectType}';
    customerProjectName                                        @title: '{i18n>Offers.customerProjectName}';
    customerProjectNumber                                      @title: '{i18n>Offers.customerProjectNumber}';
    fleetProjectNumber                                         @title: '{i18n>Offers.fleetProjectNumber}';
    fleetProjectCompanyNumber                                  @title: '{i18n>Offers.fleetProjectCompanyNumber}';
    createdBySalesSystem                                       @title: '{i18n>Offers.createdBySalesSystem}';
    salesPartner                                               @title: '{i18n>SalesPartner}';
    brand                                                      @title: '{i18n>Brand}';
    carConfigurationID                                         @title: '{i18n>Offers.carConfigurationID}';
    carConfigurationIsValid                                    @title: '{i18n>Offers.carConfigurationIsValid}';
    carConfigurationConfiguredAt                               @title: '{i18n>Offers.carConfigurationConfiguredAt}';
    hasSalesPartner                                            @title: '{i18n>Offers.hasSalesPartner}';
    carConfigurationModel                                      @title: '{i18n>Offers.carConfigurationModel}';
    carConfigurationExteriorColor                              @title: '{i18n>Offers.carConfigurationExteriorColor}';
    carConfigurationExteriorColorSalesPriceConstraintEquipment @title: '{i18n>Offers.carConfigurationExteriorColorSalesPriceConstraintEquipment}';
    carConfigurationExteriorColorSalesPriceConstraintColor     @title: '{i18n>Offers.carConfigurationExteriorColorSalesPriceConstraintColor}';
    carConfigurationExteriorColorSalesPrice                    @title: '{i18n>Offers.carConfigurationExteriorColorSalesPrice}';
    carConfigurationInteriorColor                              @title: '{i18n>Offers.carConfigurationInteriorColor}';
    carConfigurationInteriorColorSalesPriceConstraintEquipment @title: '{i18n>Offers.carConfigurationInteriorColorSalesPriceConstraintEquipment}';
    carConfigurationInteriorColorSalesPriceConstraintColor     @title: '{i18n>Offers.carConfigurationInteriorColorSalesPriceConstraintColor}';
    carConfigurationInteriorColorSalesPrice                    @title: '{i18n>Offers.carConfigurationInteriorColorSalesPrice}';
    carConfigurationRoofColor                                  @title: '{i18n>Offers.carConfigurationRoofColor}';
    carConfigurationRoofColorSalesPriceConstraintEquipment     @title: '{i18n>Offers.carConfigurationRoofColorSalesPriceConstraintEquipment}';
    carConfigurationRoofColorSalesPriceConstraintColor         @title: '{i18n>Offers.carConfigurationRoofColorSalesPriceConstraintColor}';
    carConfigurationRoofColorSalesPrice                        @title: '{i18n>Offers.carConfigurationRoofColorSalesPrice}';
    callback                                                   @title: '{i18n>Callback}';
};


annotate db.Offers with @Common.SemanticKey: [ocd];

annotate db.Offers with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Offer}',
    TypeNamePlural: '{i18n>Offers}',
    Title         : {
        $Type: 'UI.DataField',
        Value: ocd
    }
}};
