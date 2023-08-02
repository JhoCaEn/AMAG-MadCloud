using {retail.dwb as db} from '../../../db';

annotate db.PurchaseOrderStates with {
    code          @title: '{i18n>General.code}';
    name          @title: '{i18n>General.name}';
    orderCreated  @title: '{i18n>PurchaseOrderStates.orderCreated}';
    orderReleased @title: '{i18n>PurchaseOrderStates.orderReleased}';
};

annotate db.PurchaseOrderStates with @Common.SemanticKey: [code];

annotate db.PurchaseOrderStates with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>PurchaseOrderState}',
    TypeNamePlural: '{i18n>PurchaseOrderStates}',
    Title         : {
        $Type: 'UI.DataField',
        Value: code
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
