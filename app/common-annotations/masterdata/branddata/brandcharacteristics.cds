using {retail.dwb as db} from '../../../../db';

annotate db.BrandCharacteristics with {
    // configurationDateName @title: '{i18n>BrandCharacteristics.configurationDateName}';
    // brandName             @title: '{i18n>BrandCharacteristics.brandName}';
    // salesTypeName         @title: '{i18n>BrandCharacteristics.salesTypeName}';
    // engineName            @title: '{i18n>BrandCharacteristics.engineName}';
    // transmissionName      @title: '{i18n>BrandCharacteristics.transmissionName}';
    // modelName             @title: '{i18n>BrandCharacteristics.modelName}';
    // modelYearName         @title: '{i18n>BrandCharacteristics.modelYearName}';
    // exteriorColorName     @title: '{i18n>BrandCharacteristics.exteriorColorName}';
    // interiorColorName     @title: '{i18n>BrandCharacteristics.interiorColorName}';
    // roofColorName         @title: '{i18n>BrandCharacteristics.roofColorName}';
    // equipmentName         @title: '{i18n>BrandCharacteristics.equipmentName}';
    // internalWorkName      @title: '{i18n>BrandCharacteristics.internalWorkName}';
    // additionalWorkName    @title: '{i18n>BrandCharacteristics.additionalWorkName}';
    createdAt  @title: '{i18n>replicated.createdAt}';
    modifiedAt @title: '{i18n>replicated.modifiedAt}';
};
