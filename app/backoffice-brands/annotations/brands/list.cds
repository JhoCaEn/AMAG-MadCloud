using AppBackofficeBrandsService as service from '../../../../srv';

annotate service.Brands with @UI: {

    SelectionFields    : [
        code,
        organizationDivision,
        distributionChannel,
    ],

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [code],
        SortOrder     : [{
            Property  : code,
            Descending: false,
        }, ],
    },

    LineItem           : [
        {
            $Type                : 'UI.DataField',
            Value                : code,
            ![@UI.Importance]    : #High,
            ![@HTML5.CssDefaults]: {width: '5rem'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : organizationDivision,
            ![@UI.Importance]: #Low,
        },
        {
            $Type            : 'UI.DataField',
            Value            : distributionChannel,
            ![@UI.Importance]: #Low,
        },
        {
            $Type                : 'UI.DataField',
            Value                : name,
            ![@UI.Importance]    : #Low,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
    ],

};
