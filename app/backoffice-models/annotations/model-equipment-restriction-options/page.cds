using AppBackofficeModelsService as service from '../../../../srv';
using from '../model-equipment-restriction-option-rules/list';

annotate service.ModelEquipmentRestrictionOptions with @UI: {

    Facets: [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'RulesFacet',
        Label : '{i18n>RestrictionRules}',
        Target: 'rules/@UI.PresentationVariant'
    }]
};
