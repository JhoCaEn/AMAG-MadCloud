using {retail.dwb as db} from '../../../db';

annotate db.CustomerStates with {
    code @title: '{i18n>General.code}';
    name @title: '{i18n>General.name}';
};

annotate db.CustomerStates with @Common.SemanticKey: [code];

annotate db.CustomerStates with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>CustomerState}',
    TypeNamePlural: '{i18n>CustomerStates}',
    Title         : {
        $Type: 'UI.DataField',
        Value: code
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
