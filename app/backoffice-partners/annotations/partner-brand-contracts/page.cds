using AppBackofficePartnersService as service from '../../../../srv';
using from '../brand-contract-type-model-categories/list';

annotate service.PartnerBrandContracts with @UI: {

    Facets: [{
        $Type : 'UI.CollectionFacet',
        ID    : 'ModelCategoriesSection',
        Label : '{i18n>ModelCategories}',
        Facets: [{
            $Type : 'UI.ReferenceFacet',
            ID    : 'ModelCategoriesFacet',
            Target: 'modelCategories/@UI.PresentationVariant'
        }]
    }]
};
