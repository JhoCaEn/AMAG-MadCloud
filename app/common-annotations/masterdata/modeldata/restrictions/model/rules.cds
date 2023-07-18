using {retail.dwb as db} from '../../../../../../db';

annotate db.ModelRestrictionRules with {
    restriction @title: '{i18n>ModelRestriction}';
    id          @title: '{i18n>General.ID}';
    category    @title: '{i18n>EquipmentCategory}';
    color       @title: '{i18n>Color}';
    equipment   @title: '{i18n>Equipment}';
    isRequired  @title: '{i18n>RestrictionRules.isRequired}';
    isForbidden @title: '{i18n>RestrictionRules.isForbidden}';
    createdAt   @title: '{i18n>replicated.createdAt}';
    modifiedAt  @title: '{i18n>replicated.modifiedAt}';
};

annotate db.ModelRestrictionRules with @Common.SemanticKey: [
    restriction_id,
    id,
];

annotate db.ModelRestrictionRules with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelRestrictionRule}',
    TypeNamePlural: '{i18n>ModelRestrictionRules}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    } 
}};
