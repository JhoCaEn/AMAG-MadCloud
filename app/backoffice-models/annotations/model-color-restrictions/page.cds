using AppBackofficeModelsService as service from '../../../../srv';
using from '../model-color-restriction-constraints/list';

annotate service.ModelColorRestrictions with @UI: {

    Facets: [
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'ConstraintsSubSection',
            Label : '{i18n>Constraints}',
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
                Value: type_code
            },
            {
                $Type: 'UI.DataField',
                Value: constraint
            },
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
