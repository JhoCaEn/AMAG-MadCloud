using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerBrandSoldToPartners with @(UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem']
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
