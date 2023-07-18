using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerBrandSoldToPartners with @(UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [id],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : id,
            Descending: false,
        }, ]
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
            ![@UI.Importance]: #High
        }
    ]
});
