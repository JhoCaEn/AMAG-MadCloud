using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipmentRestrictions with @UI: {
    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [constraintDisplay],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : constraintDisplay,
            Descending: false,
        }, ]
    },

    LineItem           : [{
        $Type                : 'UI.DataField',
        Value                : constraintDisplay,
        ![@UI.Importance]    : #High,
        ![@HTML5.CssDefaults]: {width: 'auto'}
    }]
};
