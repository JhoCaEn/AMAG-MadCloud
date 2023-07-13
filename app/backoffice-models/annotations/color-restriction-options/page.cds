using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorRestrictionOptions with @UI: {

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
            ID    : 'RulesSection',
            Label : '{i18n>BackofficeModels.FieldGroup.Rules}',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                ID    : 'ConstraintsFacet',
                Target: 'rules/@UI.PresentationVariant'
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
