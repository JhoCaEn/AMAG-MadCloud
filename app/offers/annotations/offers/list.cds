using AppOffersService as service from '../../../../srv';

annotate service.Offers with @UI: {
    SelectionFields    : [
        ocd,
        salesPartner_id,
        brand_code
    ],

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [ocd],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : ocd,
            Descending: false,
        }, ]
    },

    LineItem           : [
        {
            $Type                : 'UI.DataField',
            Value                : ocd,
            ![@HTML5.CssDefaults]: {width: 'auto'},
        },
        {
            $Type            : 'UI.DataField',
            Value            : salesPartner_id,
            ![@UI.Importance]: #Low,
        },
        {
            $Type            : 'UI.DataField',
            Value            : brand_code,
            ![@UI.Importance]: #Low,
        },
        {
            $Type              : 'UI.DataFieldForAction',
            Label              : '{i18n>Offers.Actions.copy}',
            Action             : 'AppOffersService.copy',
            ![@UI.IsCopyAction]: true,
        }
    ]
};
