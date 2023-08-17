using {retail.dwb as db} from '../../../db';

annotate db.OrderTypes with {
    code                 @title: '{i18n>General.code}';
    name                 @title: '{i18n>General.name}';
};

annotate db.OrderTypes with @Common.SemanticKey: [code];

annotate db.OrderTypes with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>OrderType}',
    TypeNamePlural: '{i18n>OrderTypes}',
    Title         : {
        $Type: 'UI.DataField',
        Value: code
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};