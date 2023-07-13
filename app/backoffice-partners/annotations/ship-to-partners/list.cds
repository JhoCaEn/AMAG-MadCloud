using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerBrandShipToPartners with @(UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [brand_brand_code],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : brand_brand_code,
            Descending: false,
        }, ]
    },

    LineItem           : [
        {
            $Type            : 'UI.DataField',
            Value            : brand_brand_code,
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
            ![@UI.Importance]: #High
        }
    ]
});
