using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorCombinations with @UI: {

Facets: [{
    $Type : 'UI.CollectionFacet',
    ID    : 'ColorRestrictionsSection',
    Label : '{i18n>BackofficeModels.FieldGroup.Restrictions}',
    Facets: [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'ColorRestrictionsFacet',
        Target: 'restrictions/@UI.PresentationVariant'
    }]
}]};
