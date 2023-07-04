using {retail.dwb as db} from '../../../../db';

annotate db.EquipmentChapters with {
    id                       @title: '{i18n>General.ID}';
    name                     @title: '{i18n>General.name}';
    brand                    @title: '{i18n>Brand}';
    characteristicName       @title: '{i18n>EquipmentChapters.characteristicName}';
    isVisible                @title: '{i18n>EquipmentChapters.isVisible}';
    isVisibleInConfigurator  @title: '{i18n>EquipmentChapters.isVisibleInConfigurator}';
    isVisibleInSellingSystem @title: '{i18n>EquipmentChapters.isVisibleInSellingSystem}';
    createdAt                @title: '{i18n>replicated.createdAt}';
    modifiedAt               @title: '{i18n>replicated.modifiedAt}';
};

annotate db.EquipmentChapters with @Common.SemanticKey: [
    brand_code,
    id
];

annotate db.EquipmentChapters with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>EquipmentChapter}',
    TypeNamePlural: '{i18n>EquipmentChapters}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
