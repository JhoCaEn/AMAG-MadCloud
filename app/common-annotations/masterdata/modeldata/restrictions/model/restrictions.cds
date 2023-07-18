using {retail.dwb as db} from '../../../../../../db';

annotate db.ModelRestrictions with {
    model      @title: '{i18n>Model}';
    id         @title: '{i18n>General.ID}';
    createdAt  @title: '{i18n>replicated.createdAt}';
    modifiedAt @title: '{i18n>replicated.modifiedAt}';
};

annotate db.ModelRestrictions with @Common.SemanticKey: [
    model_id,
    id
];

annotate db.ModelRestrictions with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelRestriction}',
    TypeNamePlural: '{i18n>ModelRestrictions}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    }  
}};
