using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelRestrictionRules with @UI: {

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
            Value            : category_id,
            ![@UI.Importance]: #Medium,
        },
        {
            $Type         : 'UI.DataFieldWithIntentBasedNavigation',
            Value         : color_id,
            Label         : '{i18n>Color}',
            SemanticObject: 'DWBBOColor',
            Action        : 'manage',
            Mapping       : [{
                $Type                 : 'Common.SemanticObjectMappingType',
                LocalProperty         : color_id,
                SemanticObjectProperty: 'id',
            }, ]
        },
        {
            $Type         : 'UI.DataFieldWithIntentBasedNavigation',
            Value         : equipment_id,
            Label         : '{i18n>Equipment}',
            SemanticObject: 'DWBBOEquipment',
            Action        : 'manage',
            Mapping       : [{
                $Type                 : 'Common.SemanticObjectMappingType',
                LocalProperty         : equipment_id,
                SemanticObjectProperty: 'id',
            }, ]
        },
        {
            $Type            : 'UI.DataField',
            Value            : isRequired,
            ![@UI.Importance]: #High,
        },
        {
            $Type            : 'UI.DataField',
            Value            : isForbidden,
            ![@UI.Importance]: #High,
        }
    ]
};
