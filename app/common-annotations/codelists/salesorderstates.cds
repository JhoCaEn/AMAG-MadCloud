using {retail.dwb as db} from '../../../db';

annotate db.SalesOrderStates with {
    code  @title: '{i18n>General.code}';
    name  @title: '{i18n>General.name}';
};

annotate db.SalesOrderStates with @Common.SemanticKey: [code];

annotate db.SalesOrderStates with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>SalesOrderState}',
    TypeNamePlural: '{i18n>SalesOrderStates}',
    Title         : {
        $Type: 'UI.DataField',
        Value: code
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};