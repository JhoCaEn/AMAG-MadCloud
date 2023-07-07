using {retail.dwb as db} from '../../../../db';

annotate db.ModelRestrictionRules with {
    id          @title: '{i18n>ModelRestrictionRules.rule}';
    category    @title: '{i18n>General.category}';
    color       @title: '{i18n>ModelRestrictionRules.color}';
    equipment   @title: '{i18n>ModelRestrictionRules.equipment}';
    isRequired  @title: '{i18n>ModelRestrictionRules.isRequired}';
    isForbidden @title: '{i18n>ModelRestrictionRules.isForbidden}';
    modifiedAt  @title: '{i18n>replicated.modifiedAt}';
};
