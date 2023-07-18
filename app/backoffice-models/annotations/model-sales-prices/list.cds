using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelSalesPrices with @UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [validFrom],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : validFrom,
            Descending: false,
        }, ]
    },

    LineItem           : [
        {
            $Type            : 'UI.DataField',
            Value            : validFrom,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: '7rem'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : validTo,
            ![@UI.Importance]: #Medium,
            ![@HTML5.CssDefaults]: {width: '7rem'}
        },
        {
            $Type                : 'UI.DataField',
            Value                : value,
            ![@UI.Importance]    : #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : currency,
            ![@UI.Importance]: #Low
        }
    ]
};
