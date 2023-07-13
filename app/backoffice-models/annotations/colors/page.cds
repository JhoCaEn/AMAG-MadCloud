using AppBackofficeModelsService as service from '../../../../srv';

//waiting for SAP response

annotate service.ModelColors with @UI.Identification: [
    // {
    //     $Type         : 'UI.DataFieldWithIntentBasedNavigation',
    //     Value         : id,
    //     Label         : '{i18n>Detail}',
    //     SemanticObject: 'DWBBOColor',
    //     Action        : 'manage',
    //     Mapping       : [{
    //         $Type                 : 'Common.SemanticObjectMappingType',
    //         LocalProperty         : id,
    //         SemanticObjectProperty: 'id',
    //     }]
    // }
];

annotate service.ModelColors with @UI: {

    Facets             : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneralFacet',
        Label : '{i18n>General.FieldGroup.General}',
        Target: '@UI.FieldGroup#General'
    }],

    FieldGroup #General: {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: color_id,
            },
            {
                $Type: 'UI.DataField',
                Value: color.name
            },
        ]
    }
};
