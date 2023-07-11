using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorRestrictionOptionRules with @Common.SemanticKey: [id];

annotate service.ModelColorRestrictionOptionRules  with @UI: {

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
        },
        {
            $Type            : 'UI.DataField',
            Value            : category_id,
            ![@UI.Importance]: #High
        },
        {
            $Type            : 'UI.DataField',
            Value            : color_id,
            ![@UI.Importance]: #High
        },
        {
            $Type            : 'UI.DataField',
            Value            : equipment_id,
            ![@UI.Importance]: #High
        },
        {
            $Type            : 'UI.DataField',
            Value            : isRequired,
            ![@UI.Importance]: #High
        },
        {
            $Type            : 'UI.DataField',
            Value            : isForbidden,
            ![@UI.Importance]: #High
        }
    ]
};