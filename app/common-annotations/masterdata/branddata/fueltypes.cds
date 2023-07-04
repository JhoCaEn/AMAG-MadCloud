using {retail.dwb as db} from '../../../../db';

annotate db.FuelTypes with {
    id         @title: '{i18n>General.ID}';
    name       @title: '{i18n>General.name}';
    brand      @title: '{i18n>Brand}';
    unit       @title: '{i18n>FuelTypes.unit}';
    createdAt  @title: '{i18n>replicated.createdAt}';
    modifiedAt @title: '{i18n>replicated.modifiedAt}';
};

annotate db.FuelTypes with @Common.SemanticKey: [
    brand_code,
    id
];

annotate db.FuelTypes with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>FuelType}',
    TypeNamePlural: '{i18n>FuelTypes}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
