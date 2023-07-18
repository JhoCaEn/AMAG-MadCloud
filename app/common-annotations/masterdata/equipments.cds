using {retail.dwb as db} from '../../../db';

annotate db.Equipments with {
    id           @title: '{i18n>General.ID}';
    code         @title: '{i18n>General.code}';
    technicalKey @title: '{i18n>General.technicalKey}';
    name         @title: '{i18n>General.name}';
    displayName  @title: '{i18n>General.displayName}';
    chapter      @title: '{i18n>EquipmentChapter}';
    category     @title: '{i18n>EquipmentCategory}';
    brand        @title: '{i18n>Brand}';
    createdAt    @title: '{i18n>replicated.createdAt}';
    modifiedAt   @title: '{i18n>replicated.modifiedAt}';
};

annotate db.Equipments with @Common.SemanticKey: [id];

annotate db.Equipments with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Equipment}',
    TypeNamePlural: '{i18n>Equipments}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
