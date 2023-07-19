using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerBrandPaidByPartners with @(UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [
            id,
            validFrom
        ],
        SortOrder     : [
            {
                $Type     : 'Common.SortOrderType',
                Property  : id,
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
            Value            : id,
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
            Value            : isDefault,
            ![@UI.Importance]: #Low
        },
        {
            $Type            : 'UI.DataField',
            Value            : name,
            ![@UI.Importance]: #Low,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        }        
    ]
});
