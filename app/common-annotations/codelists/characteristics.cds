using {retail.dwb as db} from '../../../db';

annotate db.Characteristics with {
    code                 @title: '{i18n>General.code}';
    name                 @title: '{i18n>General.name}';
};

annotate db.Characteristics with @Common.SemanticKey: [code];

annotate db.Characteristics with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Characteristic}',
    TypeNamePlural: '{i18n>Characteristics}',
    Title         : {
        $Type: 'UI.DataField',
        Value: code
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};