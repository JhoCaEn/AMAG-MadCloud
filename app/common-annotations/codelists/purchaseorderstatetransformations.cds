using {retail.dwb as db} from '../../../db';

annotate db.PurchaseOrderStateTransformations with {
    code @title: '{i18n>General.code}';
    name @title: '{i18n>General.name}';
};

annotate db.PurchaseOrderStateTransformations with @Common.SemanticKey: [code];

annotate db.PurchaseOrderStateTransformations with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>PurchaseOrderStateTransformation}',
    TypeNamePlural: '{i18n>PurchaseOrderStateTransformations}',
    Title         : {
        $Type: 'UI.DataField',
        Value: code
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
