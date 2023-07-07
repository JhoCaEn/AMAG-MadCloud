using {retail.dwb as db} from '../../../db';

annotate db.ColorTypes with {
    code @title: '{i18n>General.code}';
    name @title: '{i18n>name}';
};

annotate db.ColorTypes with @Common.SemanticKey: [code];

annotate db.ColorTypes with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ColorType}',
    TypeNamePlural: '{i18n>ColorTypes}',
    Title         : {
        $Type: 'UI.DataField',
        Value: code
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
