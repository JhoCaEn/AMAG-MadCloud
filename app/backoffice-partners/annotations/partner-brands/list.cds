using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerBrands with @(UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [brand_code],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : brand_code,
            Descending: false,
        }, ]
    },

    LineItem           : [
        {
            $Type            : 'UI.DataField',
            Value            : brand_code,
            ![@UI.Importance]: #High
        },
        {
            $Type            : 'UI.DataField',
            Value            : validFrom,
            ![@UI.Importance]: #Low
        },
        {
            $Type            : 'UI.DataField',
            Value            : validTo,
            ![@UI.Importance]: #Low
        },
        {
            $Type            : 'UI.DataField',
            Value            : isRepresentative,
            ![@UI.Importance]: #High
        },
        {
            $Type            : 'UI.DataField',
            Value            : dealerPartnerID,
            ![@UI.Importance]: #High
        },
        {
            $Type                : 'UI.DataField',
            Value                : hasContracts,
            ![@UI.Importance]    : #Low,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : createdAt,
            ![@UI.Importance]: #High
        },
    ]
});
