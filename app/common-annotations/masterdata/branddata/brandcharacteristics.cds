using {retail.dwb as db} from '../../../../db';

annotate db.BrandCharacteristics with {
    brand          @title: '{i18n>Brand}';
    characteristic @title: '{i18n>BrandCharacteristic}';
    value          @title: '{i18n>BrandCharacteristics.value}';
    createdAt      @title: '{i18n>replicated.createdAt}';
    modifiedAt     @title: '{i18n>replicated.modifiedAt}';
};

annotate db.BrandCharacteristics with @Common.SemanticKey: [
    brand_code,
    characteristic_code
];

annotate db.BrandCharacteristics with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>BrandCharacteristic}',
    TypeNamePlural: '{i18n>BrandCharacteristics}',
    Title         : {
        $Type: 'UI.DataField',
        Value: characteristic_code
    }
}};