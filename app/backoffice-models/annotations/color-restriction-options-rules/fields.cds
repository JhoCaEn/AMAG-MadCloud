using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorRestrictionOptionRules with {
    id          @title : '{i18n>General.ID}';
    category    @title : '{i18n>General.category}';
    color       @title : '{i18n>ModelRestrictionOptionRules.color}';
    equipment   @title : '{i18n>ModelRestrictionOptionRules.equipment}';
    isRequired  @title : '{i18n>ModelRestrictionOptionRules.isRequired}';
    isForbidden @title : '{i18n>ModelRestrictionOptionRules.isForbidden}';

    equipment        @Common: {
        Text           : equipment.name,
        TextArrangement: #TextFirst
    };
};
