using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorRestrictionOptions with @Common.SemanticKey: [id];

annotate service.ModelColorRestrictionOptions  with @UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [id]
    },

    LineItem           : [
        {
            $Type            : 'UI.DataField',
            Value            : id,
            ![@UI.Importance]: #High
        }
    ]
};