using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorRestrictions with @UI: {

Facets: [
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
]};
