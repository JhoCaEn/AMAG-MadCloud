using {retail.dwb as db} from '../../../db';

annotate db.Offers with {
    ID                            @title: '{i18n>General.ID}';
    ocd                           @title: '{i18n>Offers.ocd}';
    customerProjectName           @title: '{i18n>Offers.customerProjectName}';
    customerProjectNumber         @title: '{i18n>Offers.customerProjectNumber}';
    fleetProjectNumber            @title: '{i18n>Offers.fleetProjectNumber}';
    fleetProjectCompanyNumber     @title: '{i18n>Offers.fleetProjectCompanyNumber}';
    createdBySalesSystem          @title: '{i18n>Offers.createdBySalesSystem}';
    salesPartner                  @title: '{i18n>SalesPartner}';
    brand                         @title: '{i18n>Brand}';
    carConfigurationID            @title: '{i18n>Offers.carConfigurationID}';
    carConfigurationIsValid       @title: '{i18n>Offers.carConfigurationIsValid}';
    carConfigurationConfiguredAt  @title: '{i18n>Offers.carConfigurationConfiguredAt}';
    hasSalesPartner               @title: '{i18n>Offers.hasSalesPartner}';
    carConfigurationModel         @title: '{i18n>Offers.carConfigurationModel}';
    carConfigurationExteriorColor @title: '{i18n>Offers.carConfigurationExteriorColor}';
    carConfigurationInteriorColor @title: '{i18n>Offers.carConfigurationInteriorColor}';
    carConfigurationRoofColor     @title: '{i18n>Offers.carConfigurationRoofColor}';

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
