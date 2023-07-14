using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorRestrictionOptions with @UI: {

    Facets: [
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
    ]

};
