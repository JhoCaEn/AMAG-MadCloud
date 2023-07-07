using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorRestrictions with @Common.SemanticKey: [type_code];

annotate service.ModelColorRestrictions with @UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [type_code]
    },

    LineItem           : [
        {
            $Type            : 'UI.DataField',
            Value            : type_code,
            ![@UI.Importance]: #High
        },
        {
            $Type            : 'UI.DataField',
            Value            : constraint,
            ![@UI.Importance]: #Medium,
        }
    ]
};