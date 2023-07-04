using {retail.dwb as db} from '../../../../db';

annotate db.EquipmentCategories with {
    id         @title: '{i18n>General.ID}';
    name       @title: '{i18n>General.name}';
    brand      @title: '{i18n>Brand}';
    createdAt  @title: '{i18n>replicated.createdAt}';
    modifiedAt @title: '{i18n>replicated.modifiedAt}';
};

annotate db.EquipmentCategories with @Common.SemanticKey: [
    brand_code,
    id
];

annotate db.EquipmentCategories with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>EquipmentCategory}',
    TypeNamePlural: '{i18n>EquipmentCategories}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
