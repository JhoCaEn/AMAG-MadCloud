using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerBrandContracts with @UI: {Facets: [{
    $Type : 'UI.CollectionFacet',
    ID    : 'ModelCategoriesSection',
    Label : '{i18n>BackofficePartners.CollectionFacet.ModelCategory}',
    Facets: [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'ModelCategoriesFacet',
        Target: 'modelCategories/@UI.PresentationVariant'
    }]
}]};