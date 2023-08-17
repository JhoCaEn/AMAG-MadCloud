using {retail.dwb as db} from '../../../db';

annotate db.CarConfigurations with {
    ID                                         @title: '{i18n>CarConfigurations.ID}';
    configuredAt                               @title: '{i18n>CarConfigurations.configuredAt}';
    partner                                    @title: '{i18n>Partner}';
    brand                                      @title: '{i18n>Brand}';
    salesOrganisation                          @title: '{i18n>CarConfigurations.salesOrganisation}';
    isNewConfiguration                         @title: '{i18n>CarConfigurations.isNewConfiguration}';
    isPrepared                                 @title: '{i18n>CarConfigurations.isPrepared}';
    model                                      @title: '{i18n>Model}';
    hasSelectableExteriorColors                @title: '{i18n>CarConfigurations.hasSelectableExteriorColors}';
    hasSelectableInteriorColors                @title: '{i18n>CarConfigurations.hasSelectableInteriorColors}';
    hasSelectableRoofColors                    @title: '{i18n>CarConfigurations.hasSelectableRoofColors}';
    exteriorColor                              @title: '{i18n>ExteriorColor}';
    interiorColor                              @title: '{i18n>InteriorColor}';
    roofColor                                  @title: '{i18n>RoofColor}';
    hasValidColorCombination                   @title: '{i18n>CarConfigurations.hasValidColorCombination}';
    preselectedModel                           @title: '{i18n>CarConfigurations.preselectedModel}';
    preselectedExteriorColor                   @title: '{i18n>CarConfigurations.preselectedExteriorColor}';
    preselectedInteriorColor                   @title: '{i18n>CarConfigurations.preselectedInteriorColor}';
    preselectedRoofColor                       @title: '{i18n>CarConfigurations.preselectedRoofColor}';
    exteriorColorSalesPriceConstraintEquipment @title: '{i18n>CarConfigurations.exteriorColorSalesPriceConstraintEquipment}';
    exteriorColorSalesPriceConstraintColor     @title: '{i18n>CarConfigurations.exteriorColorSalesPriceConstraintColor}';
    interiorColorSalesPriceConstraintEquipment @title: '{i18n>CarConfigurations.interiorColorSalesPriceConstraintEquipment}';
    interiorColorSalesPriceConstraintColor     @title: '{i18n>CarConfigurations.interiorColorSalesPriceConstraintColor}';
    roofColorSalesPriceConstraintEquipment     @title: '{i18n>CarConfigurations.roofColorSalesPriceConstraintEquipment}';
    roofColorSalesPriceConstraintColor         @title: '{i18n>CarConfigurations.roofColorSalesPriceConstraintColor}';
    callback                                   @title: '{i18n>Callback}';
}

/*
annotate db.CarConfigurations with {
    ID            @UI.Hidden;
    brand         @title           : '{i18n>Brand}';
    brand         @Core.Computed;
    brand         @Common          : {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
    partner       @title           : '{i18n>partner}';
    partner       @Common          : {
        Text           : partner.name,
        TextArrangement: #TextOnly
    };
    model         @Common          : {
        Text           : model.name,
        TextArrangement: #TextOnly
    };
    exteriorColor @Core.Computed;
    exteriorColor @Common          : {
        Text           : exteriorColor.displayName,
        TextArrangement: #TextOnly
    };
    interiorColor @Core.Computed;
    interiorColor @Common          : {
        Text           : interiorColor.displayName,
        TextArrangement: #TextOnly
    };
    roofColor     @Core.Computed;
    roofColor     @Common          : {
        Text           : roofColor.displayName,
        TextArrangement: #TextOnly
    };
};
*/

annotate db.CarConfigurations with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>CarConfiguration}',
    TypeNamePlural: '{i18n>CarConfigurations}',
    Title         : {
        $Type: 'UI.DataField',
        Value: brand_code
    }
}};
