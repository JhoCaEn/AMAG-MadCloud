using AppBackofficePartnersService as service from '../../../../srv';

annotate service.Partners with @Common.SemanticKey: [id];

annotate service.Partners with @UI: {
    SelectionFields    : [
        id,
        hasBrands,
        hasContracts
    ],

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
            Value            : hasBrands,
            ![@UI.Importance]: #High
        },
        {
            $Type            : 'UI.DataField',
            Value            : hasContracts,
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
