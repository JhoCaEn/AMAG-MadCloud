using AppBackofficePurchaseOrderStatesService as service from '../../../../srv';

annotate service.Transformations with @UI: {
    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [code],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : code,
            Descending: false
        }]
    },

    LineItem           : [
        {
            $Type                : 'UI.DataField',
            Value                : code,
            ![@UI.Importance]    : #High,
            ![@HTML5.CssDefaults]: {width: '5rem'}
        },
        {
            $Type                : 'UI.DataField',
            Value                : name,
            ![@UI.Importance]    : #Low,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        }
    ]
};
