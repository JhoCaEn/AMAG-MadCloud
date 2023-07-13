using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorRestrictions with @UI: {

    Facets: [
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'GeneralSection',
            Label : '{i18n>General.FieldGroup.General}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'GeneralSubSection',
                Label : '{i18n>General.FieldGroup.General}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'GeneralFacet',
                    Target: '@UI.FieldGroup#General'
                }]
            }],
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'ConstraintsSubSection',
            Label : '{i18n>BackofficeModels.FieldGroup.Conditions}',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                ID    : 'ConstraintsFacet',
                Target: 'constraints/@UI.PresentationVariant'
            }]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'OptionsSubSection',
            Label : '{i18n>BackofficeModels.FieldGroup.Options}',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                ID    : 'OptionsFacet',
                Target: 'options/@UI.PresentationVariant'
            }]
        }
    ],
    
    FieldGroup #General     : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: createdAt
            },            
            {
                $Type: 'UI.DataField',
                Value: modifiedAt
            }
        ]
    }
};
