using {retail.dwb as db} from '../../../../db';

annotate db.ModelRestrictions with {
    id @title: '{i18n>General.ID}';
    modifiedAt @title: '{i18n>replicated.modifiedAt}';
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
