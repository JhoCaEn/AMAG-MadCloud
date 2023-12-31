using AppBackofficeEquipmentsService as service from '../../../../srv';

annotate service.Equipments.texts with @UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [locale, ],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : locale,
            Descending: false,
        }, ]
    },

    LineItem           : [
        {
            $Type            : 'UI.DataField',
            Value            : locale,
            ![@UI.Importance]: #High,
        },
        {
            $Type            : 'UI.DataField',
            Value            : name,
            ![@UI.Importance]: #Low,
        },
        {
            $Type                : 'UI.DataField',
            Value                : displayName,
            ![@UI.Importance]    : #High,
            ![@HTML5.CssDefaults]: {width: 'auto'},
        },
    ]
};
