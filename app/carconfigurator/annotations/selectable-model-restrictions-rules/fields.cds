using AppCarConfiguratorService as service from '../../../../srv';

annotate service.SelectableModelRestrictionsRules with {
    categoryId @title: '{i18n>General.category}';
    id         @title: '{i18n>RestrictionRule}';
}
