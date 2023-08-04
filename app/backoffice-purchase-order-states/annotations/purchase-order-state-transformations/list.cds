using AppBackofficePurchaseOrderStatesService as service from '../../../../srv';

annotate service.PurchaseOrderStateTransformations with @UI: {
    SelectionFields: [
        code,
        name,
    ],
    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [code],
        SortOrder     : [{
            Property  : name,
            Descending: false
        }]
    },
    LineItem       : [
        {
            $Type            : 'UI.DataField',
            Value            : code,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },  
        {
            $Type            : 'UI.DataField',
            Value            : name,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        }
    ]
};
