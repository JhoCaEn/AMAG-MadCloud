using AppBackofficePartnersService as service from '../../../../srv';

annotate service.BrandContractTypeModelCategories with @Common.SemanticKey: [modelCategoryCode];

annotate service.BrandContractTypeModelCategories with {
    modelCategoryCode @title: '{i18n>BackofficePartners.ModelCategory}';
    modelCategoryName @title: '{i18n>General.name}';
};
