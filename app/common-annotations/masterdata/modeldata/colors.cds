using {retail.dwb as db} from '../../../../db';

annotate db.ModelColors with {
    model         @title: '{i18n>Model}';
    color         @title: '{i18n>General.ID}';
    validFrom     @title: '{i18n>General.validFrom}';
    validTo       @title: '{i18n>General.validTo}';
    orderableFrom @title: '{i18n>General.orderableFrom}';
    orderableTo   @title: '{i18n>General.orderableTo}';
    createdAt     @title: '{i18n>replicated.createdAt}';
};

annotate db.ModelColors with @Common.SemanticKey: [
    model_id,
    color_id
];

annotate db.ModelColors with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelColor}',
    TypeNamePlural: '{i18n>ModelColors}',
    Title         : {
        $Type: 'UI.DataField',
        Value: color_id
    },
    Description         : {
        $Type: 'UI.DataField',
        Value: color.displayName
    }
}};
