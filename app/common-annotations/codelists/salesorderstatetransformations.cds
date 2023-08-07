using {retail.dwb as db} from '../../../db';

annotate db.SalesOrderStateTransformations with {
    code @title: '{i18n>General.code}';
    name @title: '{i18n>General.name}';
};

annotate db.SalesOrderStateTransformations with @Common.SemanticKey: [code];

annotate db.SalesOrderStateTransformations with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>SalesOrderStateTransformation}',
    TypeNamePlural: '{i18n>SalesOrderStateTransformations}',
    Title         : {
        $Type: 'UI.DataField',
        Value: code
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
