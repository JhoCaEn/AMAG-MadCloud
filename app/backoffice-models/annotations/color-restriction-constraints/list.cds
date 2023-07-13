using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorRestrictionConstraints with @Common.SemanticKey: [equipment_id];

annotate service.ModelColorRestrictionConstraints with @UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [equipment_id]
    },

    LineItem           : [{
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
    }, ]
};
