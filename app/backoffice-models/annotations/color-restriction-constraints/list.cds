using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorRestrictionConstraints with @Common.SemanticKey: [equipment_id];

annotate service.ModelColorRestrictionConstraints with @UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [equipment_id]
    },

    LineItem           : [
        {
            $Type            : 'UI.DataField',
            Value            : equipment_id,
            ![@UI.Importance]: #High
        }
    ]
};