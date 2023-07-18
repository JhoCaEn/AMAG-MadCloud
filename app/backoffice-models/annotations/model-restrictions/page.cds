using AppBackofficeModelsService as service from '../../../../srv';
using from '../model-restriction-rules/list';

annotate service.ModelRestrictions with @UI: {

    Facets: [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'RulesFacet',
        Label : '{i18n>RestrictionRules}',
        Target: 'rules/@UI.PresentationVariant'
    }]
};
