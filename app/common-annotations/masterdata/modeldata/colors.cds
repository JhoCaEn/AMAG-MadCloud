using {retail.dwb as db} from '../../../../db';

annotate db.ModelColors with {
    color      @title: '{i18n>General.ID}';
    modifiedAt @title: '{i18n>replicated.modifiedAt}';
};

annotate db.ModelColors with @Common.SemanticKey: [
    model_id,
    color_id
];

annotate db.ModelColors with @UI: {
    HeaderInfo: {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : '{i18n>ModelColor}',
        TypeNamePlural: '{i18n>ModelColors}',
        Title         : {
            $Type: 'UI.DataField',
            Value: color_id
        }
    }
};
