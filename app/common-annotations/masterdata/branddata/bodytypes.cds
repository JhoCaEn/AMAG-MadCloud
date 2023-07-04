using {retail.dwb as db} from '../../../../db';

annotate db.BodyTypes with {
    id         @title: '{i18n>General.ID}';
    name       @title: '{i18n>General.name}';
    brand      @title: '{i18n>Brand}';
    createdAt  @title: '{i18n>replicated.createdAt}';
    modifiedAt @title: '{i18n>replicated.modifiedAt}';
}

annotate db.BodyTypes with @Common.SemanticKey: [
    brand_code,
    id
];

annotate db.BodyTypes with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>BodyType}',
    TypeNamePlural: '{i18n>BodyTypes}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
