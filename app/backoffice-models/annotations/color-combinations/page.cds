using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorCombinations with @UI: {

    Facets: [
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'GeneralSection',
            Label : '{i18n>General.FieldGroup.General}',
            Facets: [
               {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'GeneralSubSection',
                    Label : '{i18n>General.FieldGroup.General}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'GeneralFacet',
                        Target: '@UI.FieldGroup#General'
                    }]
                }
            ]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'ColorRestrictionsSection',
            Label : '{i18n>BackofficeModels.FieldGroup.Restrictions}',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                ID    : 'ColorRestrictionsFacet',
                Target: 'restrictions/@UI.PresentationVariant'
            }]
        }
    ],

    FieldGroup #General: {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: interior_id,
            },
            {
                $Type: 'UI.DataField',
                Value: exterior_id,
            },
            {
                $Type: 'UI.DataField',
                Value: roof_id,
            }
        ]
    },
    
};
