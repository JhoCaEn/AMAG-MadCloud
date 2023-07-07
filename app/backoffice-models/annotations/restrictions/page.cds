using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelRestrictions with @UI: {

    Facets             : [
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'RulesSection',
            Label : '{i18n>BackofficeModels.FieldGroup.RestrictionRules}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'RulesSubSection',
                Label : '{i18n>BackofficeModels.FieldGroup.RestrictionRules}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'RulesFacet',
                    Target: 'rules/@UI.PresentationVariant'
                }]
            }],
        }
    ]
};
