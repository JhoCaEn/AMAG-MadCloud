using {retail.dwb as db} from '../../../db';

annotate db.ProjectTypes with {
    code                 @title: '{i18n>General.code}';
    name                 @title: '{i18n>General.name}';
};

annotate db.ProjectTypes with @Common.SemanticKey: [code];

annotate db.ProjectTypes with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ProjectType}',
    TypeNamePlural: '{i18n>ProjectTypes}',
    Title         : {
        $Type: 'UI.DataField',
        Value: code
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};