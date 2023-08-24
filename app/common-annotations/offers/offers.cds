using {retail.dwb as db} from '../../../db';

annotate db.Offers with {
    ID                                                         @title: '{i18n>General.ID}';
    ocd                                                        @title: '{i18n>Offers.ocd}';
    projectType                                                @title: '{i18n>ProjectType}';
    projectCustomerName                                        @title: '{i18n>Offers.projectCustomerName}';
    customerProjectNumber                                      @title: '{i18n>Offers.customerProjectNumber}';
    fleetProjectNumber                                         @title: '{i18n>Offers.fleetProjectNumber}';
    fleetCompanyNumber                                  @title: '{i18n>Offers.fleetCompanyNumber}';
    createdBySalesSystem                                       @title: '{i18n>Offers.createdBySalesSystem}';
    salesPartner                                               @title: '{i18n>SalesPartner}';
    brand                                                      @title: '{i18n>Brand}';
    carConfigurationID                                         @title: '{i18n>Offers.carConfigurationID}';
    carConfigurationIsValid                                    @title: '{i18n>Offers.carConfigurationIsValid}';
    configuredAt                               @title: '{i18n>Offers.configuredAt}';
    hasSalesPartner                                            @title: '{i18n>Offers.hasSalesPartner}';
    model                                      @title: '{i18n>Offers.model}';
    exteriorColor                              @title: '{i18n>Offers.exteriorColor}';
    exteriorColorSalesPriceConstraintEquipment @title: '{i18n>Offers.exteriorColorSalesPriceConstraintEquipment}';
    exteriorColorSalesPriceConstraintColor     @title: '{i18n>Offers.exteriorColorSalesPriceConstraintColor}';
    exteriorColorSalesPrice                    @title: '{i18n>Offers.exteriorColorSalesPrice}';
    interiorColor                              @title: '{i18n>Offers.interiorColor}';
    interiorColorSalesPriceConstraintEquipment @title: '{i18n>Offers.interiorColorSalesPriceConstraintEquipment}';
    interiorColorSalesPriceConstraintColor     @title: '{i18n>Offers.interiorColorSalesPriceConstraintColor}';
    interiorColorSalesPrice                    @title: '{i18n>Offers.interiorColorSalesPrice}';
    roofColor                                  @title: '{i18n>Offers.roofColor}';
    roofColorSalesPriceConstraintEquipment     @title: '{i18n>Offers.roofColorSalesPriceConstraintEquipment}';
    roofColorSalesPriceConstraintColor         @title: '{i18n>Offers.roofColorSalesPriceConstraintColor}';
    roofColorSalesPrice                        @title: '{i18n>Offers.roofColorSalesPrice}';
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
