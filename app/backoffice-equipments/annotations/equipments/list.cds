using AppBackofficeEquipmentsService as service from '../../../../srv';

annotate service.Equipments with @UI: {
    SelectionFields    : [
        id,
        code,
        brand_code,
        chapterId,
        categoryId
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
            Value            : brand_code,
            ![@UI.Importance]: #Low
        },
        {
            $Type            : 'UI.DataField',
            Value            : chapterId,
            ![@UI.Importance]: #Low
        },
        {
            $Type            : 'UI.DataField',
            Value            : categoryId,
            ![@UI.Importance]: #Low
        },
        {
            $Type                : 'UI.DataField',
            Value                : displayName,
            ![@UI.Importance]    : #Low,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : modifiedAt,
            ![@UI.Importance]: #High
        },
        {
            $Type : 'UI.DataFieldForAction',
            Label : '{i18n>General.Actions.synchronise}',
            Action: 'AppBackofficeEquipmentsService.synchronise'
        }
    ]
};
