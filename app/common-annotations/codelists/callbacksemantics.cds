using {retail.dwb as db} from '../../../db';

annotate db.CallbackSemantics with {
    code @title: '{i18n>General.code}';
    name @title: '{i18n>General.name}';
};

annotate db.CallbackSemantics with @Common.SemanticKey: [code];

annotate db.CallbackSemantics with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>CallbackSemantic}',
    TypeNamePlural: '{i18n>CallbackSemantics}',
    Title         : {
        $Type: 'UI.DataField',
        Value: code
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};