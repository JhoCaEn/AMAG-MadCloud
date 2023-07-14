using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelSalesPrices with @UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [validTo],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : validTo,
            Descending: false,
        }, ]
    },

    LineItem           : [
        {
            $Type            : 'UI.DataField',
            Value            : validFrom,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: '8rem'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : validTo,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: '8rem'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : value,
            ![@UI.Importance]: #High
        },
        {
            $Type            : 'UI.DataField',
            Value            : currency,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: '8rem'}
        }
    ]
};