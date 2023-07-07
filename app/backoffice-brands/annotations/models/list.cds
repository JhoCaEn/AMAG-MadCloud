using AppBackofficeBrandsService as service from '../../../../srv';

annotate service.Models with @UI: {

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
            $Type            : 'UI.DataField',
            Value            : code,
            ![@UI.Importance]: #High,
        },
        {
            $Type            : 'UI.DataField',
            Value            : year,
            ![@UI.Importance]: #Low,
        },
        {
            $Type                : 'UI.DataField',
            Value                : name,
            ![@UI.Importance]    : #Low,
            ![@HTML5.CssDefaults]: {width: 'auto'},
        },
    ]
};
