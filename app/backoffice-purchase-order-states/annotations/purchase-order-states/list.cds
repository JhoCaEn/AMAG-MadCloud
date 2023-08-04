using AppBackofficePurchaseOrderStatesService as service from '../../../../srv';

annotate service.PurchaseOrderStates with @UI: {
    SelectionFields: [
        code,
        name,
        orderCreated,
        orderReleased
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
        },         
        {
            $Type                : 'UI.DataField',
            Value                : orderCreated,
            ![@UI.Importance]    : #Medium,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type                : 'UI.DataField',
            Value                : orderReleased,
            ![@UI.Importance]    : #Medium,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
    ]
};
