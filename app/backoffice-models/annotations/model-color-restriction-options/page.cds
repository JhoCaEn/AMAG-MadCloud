using AppBackofficeModelsService as service from '../../../../srv';
using from '../model-color-restriction-options-rules/list';

annotate service.ModelColorRestrictionOptions with @UI: {

    Facets: [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'RulesFacet',
        Label : '{i18n>RestrictionRules}',
        Target: 'rules/@UI.PresentationVariant'
    }]
};
