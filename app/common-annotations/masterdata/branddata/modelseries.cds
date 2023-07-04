using {retail.dwb as db} from '../../../../db';

annotate db.ModelSeries with {
    id         @title: '{i18n>General.ID}';
    name       @title: '{i18n>General.name}';
    brand      @title: '{i18n>Brand}';
    createdAt  @title: '{i18n>replicated.createdAt}';
    modifiedAt @title: '{i18n>replicated.modifiedAt}';
}

annotate db.ModelSeries with @Common.SemanticKey: [
    brand_code,
    id
];

annotate db.ModelSeries with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelSerie}',
    TypeNamePlural: '{i18n>ModelSeries}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
