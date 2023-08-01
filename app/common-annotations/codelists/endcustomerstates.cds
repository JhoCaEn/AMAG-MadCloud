using {retail.dwb as db} from '../../../db';

annotate db.EndCustomerStates with {
    code @title: '{i18n>General.code}';
    name @title: '{i18n>General.name}';
};

annotate db.EndCustomerStates with @Common.SemanticKey: [code];

annotate db.EndCustomerStates with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>EndCustomerState}',
    TypeNamePlural: '{i18n>EndCustomerStates}',
    Title         : {
        $Type: 'UI.DataField',
        Value: code
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
