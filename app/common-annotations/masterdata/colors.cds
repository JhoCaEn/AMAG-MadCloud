using {retail.dwb as db} from '../../../db';

annotate db.Colors with {
    id           @title : '{i18n>General.ID}';
    code         @title : '{i18n>General.code}';
    technicalKey @title : '{i18n>General.technicalKey}';
    name         @title : '{i18n>General.name}';
    displayName  @title : '{i18n>General.displayName}';
    createdAt    @title : '{i18n>replicated.createdAt}';
    modifiedAt   @title : '{i18n>replicated.modifiedAt}';
    type         @title : '{i18n>ColorType}';
    brand        @title : '{i18n>Brand}';
    type        @Common: {
        Text           : type.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
};

annotate db.Colors with @Common.SemanticKey: [id];

annotate db.Colors with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Color}',
    TypeNamePlural: '{i18n>Colors}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
