using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipmentRestrictionOptionRules with @Common.SemanticKey: [id];

annotate service.ModelEquipmentRestrictionOptionRules with {
    id          @title : '{i18n>General.ID}';
    categoryId  @title : '{i18n>General.category}';
    color       @title : '{i18n>Color}';
    equipment   @title : '{i18n>Equipment}';
    isRequired  @title : '{i18n>ModelEquipmentRestrictionOptionRules.isRequired}';
    isForbidden @title : '{i18n>ModelEquipmentRestrictionOptionRules.isForbidden}';
    option      @UI.Hidden;
    category    @UI.Hidden;
    categoryId  @Common: {
        Text           : category.name,
        TextArrangement: #TextOnly
    };
};
