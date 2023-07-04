using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerBrandContracts with @(UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [type_code],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : type_code,
            Descending: false,
        }, ]
    },

    LineItem           : [{
        $Type                : 'UI.DataField',
        Value                : type_code,
        ![@UI.Importance]    : #High,
        ![@HTML5.CssDefaults]: {width: 'auto'}
    }, ]
});
