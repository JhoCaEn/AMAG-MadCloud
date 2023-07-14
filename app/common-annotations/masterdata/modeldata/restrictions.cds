using {retail.dwb as db} from '../../../../db';

annotate db.ModelRestrictions with {
    id         @title: '{i18n>General.ID}';
    model      @title: '{i18n>Model}';
    modifiedAt @title: '{i18n>replicated.modifiedAt}';
    createdAt  @title: '{i18n>replicated.createdAt}';
};

annotate db.ModelRestrictions with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelRestriction}',
    TypeNamePlural: '{i18n>ModelRestrictions}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    }
}};

annotate db.ModelRestrictions with @Common.SemanticKey: [
    model_id,
    id
];
