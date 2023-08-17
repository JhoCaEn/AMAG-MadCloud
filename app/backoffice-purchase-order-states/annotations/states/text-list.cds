using AppBackofficePurchaseOrderStatesService as service from '../../../../srv';

annotate service.States.texts with @UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [locale],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : locale,
            Descending: false
        }]
    },

    LineItem           : [
        {
            $Type            : 'UI.DataField',
            Value            : locale,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: '5rem'}
        },
        {
            $Type                : 'UI.DataField',
            Value                : name,
            ![@UI.Importance]    : #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        }
    ]
};
