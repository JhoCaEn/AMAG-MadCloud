using {retail.dwb as db} from '../../../../db';

annotate db.ModelRestrictionRules with {
    id          @title: '{i18n>General.ID}';
    category    @title: '{i18n>General.category}';
    color       @title: '{i18n>Color}';
    equipment   @title: '{i18n>ModelRestrictionRules.equipment}';
    isRequired  @title: '{i18n>ModelRestrictionRules.isRequired}';
    isForbidden @title: '{i18n>ModelRestrictionRules.isForbidden}';
    modifiedAt  @title: '{i18n>replicated.modifiedAt}';
    createdAt   @title: '{i18n>replicated.createdAt}';
    restriction @title: '{i18n>Restriction}';
};

annotate db.ModelRestrictionRules with @Common.SemanticKey: [
    id,
    restriction_id
];

annotate db.ModelRestrictionRules with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelRestrictionRule}',
    TypeNamePlural: '{i18n>ModelRestrictionRule}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: id
    }
}};
