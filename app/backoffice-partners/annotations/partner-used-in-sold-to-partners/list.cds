using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerUsedInSoldToPartners with @(UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [
            partner_id,
            brand_code,
            validFrom
        ],
        SortOrder     : [
            {
                $Type     : 'Common.SortOrderType',
                Property  : partner_id,
                Descending: false,
            },
            {
                $Type     : 'Common.SortOrderType',
                Property  : brand_code,
                Descending: false,
            },
            {
                $Type     : 'Common.SortOrderType',
                Property  : validFrom,
                Descending: false,
            },
        ]
    },

    LineItem           : [
        {
            $Type            : 'UI.DataField',
            Value            : partner_id,
            ![@UI.Importance]: #High
        },
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
            Value            : createdAt,
            ![@UI.Importance]: #Low
        },
        {
            $Type                : 'UI.DataField',
            Value                : name,
            ![@UI.Importance]    : #Low,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        }
    ]
});
