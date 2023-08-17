using {retail.dwb as db} from '../../../db';

annotate db.DeliveryCodes with {
    code                 @title: '{i18n>General.code}';
    name                 @title: '{i18n>General.name}';
};

annotate db.DeliveryCodes with @Common.SemanticKey: [code];

annotate db.DeliveryCodes with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>DeliveryCode}',
    TypeNamePlural: '{i18n>DeliveryCodes}',
    Title         : {
        $Type: 'UI.DataField',
        Value: code
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};