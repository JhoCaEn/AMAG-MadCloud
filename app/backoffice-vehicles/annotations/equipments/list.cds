using AppBackofficeVehiclesService as service from '../../../../srv';

annotate service.VehicleEquipments with @UI: {
    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [id],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : id,
            Descending: false
        }, ]
    },

    LineItem           : [
        {
            $Type            : 'UI.DataField',
            Value            : id,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : displayName,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        }
    ]
};
