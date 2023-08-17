using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipmentSalesPrices with @UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [
            weighting,
            validFrom
        ],
        SortOrder     : [
            {
                $Type     : 'Common.SortOrderType',
                Property  : weighting,
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
            $Type                : 'UI.DataField',
            Value                : constraintEquipmentId,
            ![@UI.Importance]    : #Low,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type                : 'UI.DataField',
            Value                : constraintColorId,
            ![@UI.Importance]    : #Low,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type                : 'UI.DataField',
            Value                : validFrom,
            ![@UI.Importance]    : #Low,
            ![@HTML5.CssDefaults]: {width: '7rem'}
        },
        {
            $Type                : 'UI.DataField',
            Value                : validTo,
            ![@UI.Importance]    : #Low,
            ![@HTML5.CssDefaults]: {width: '7rem'}
        },
        {
            $Type                : 'UI.DataField',
            Value                : value,
            ![@UI.Importance]    : #Low,
            ![@HTML5.CssDefaults]: {width: '10rem'}
        },
        {
            $Type                : 'UI.DataField',
            Value                : weighting,
            ![@UI.Importance]    : #Low,
            ![@HTML5.CssDefaults]: {width: '7rem'}
        }
    ]
};
