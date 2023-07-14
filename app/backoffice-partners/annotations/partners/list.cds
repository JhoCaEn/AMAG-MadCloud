using AppBackofficePartnersService as service from '../../../../srv';

annotate service.Partners with @Common.SemanticKey: [partnerId];

annotate service.Partners with @UI: {
    SelectionFields    : [
        partnerId,
        isSalesPartner
    ],

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [partnerId],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : partnerId,
            Descending: false,
        }, ]
    },

    LineItem           : [
        {
            $Type            : 'UI.DataField',
            Value            : partnerId,
            ![@UI.Importance]: #High
        },
        {
            $Type            : 'UI.DataField',
            Value            : isSalesPartner,
            ![@UI.Importance]: #High
        },
        {
            $Type                : 'UI.DataField',
            Value                : name,
            ![@UI.Importance]    : #Low,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : modifiedAt,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Label : '{i18n>General.Actions.synchronise}',
            Action: 'AppBackofficePartnersService.synchronise'
        }
    ]
};
