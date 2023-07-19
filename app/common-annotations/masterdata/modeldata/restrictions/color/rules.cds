using {retail.dwb as db} from '../../../../../../db';

annotate db.ModelColorRestrictionOptionRules with {
    option      @title: '{i18n>ModelColorRestrictionOption}';
    id          @title: '{i18n>General.ID}';
    category    @title: '{i18n>EquipmentCategory}';
    color       @title: '{i18n>Color}';
    equipment   @title: '{i18n>Equipment}';
    isRequired  @title: '{i18n>RestrictionRules.isRequired}';
    isForbidden @title: '{i18n>RestrictionRules.isForbidden}';
    createdAt   @title: '{i18n>replicated.createdAt}';
    modifiedAt  @title: '{i18n>replicated.modifiedAt}';
};

annotate db.ModelColorRestrictionOptionRules with @Common.SemanticKey: [
    option_restriction_colorCombination_model_id,
    option_restriction_colorCombination_exterior_id,
    option_restriction_colorCombination_interior_id,
    option_restriction_colorCombination_roof_id,
    option_restriction_type_code,
    option_restriction_constraint,
    option_id,
    id
];

annotate db.ModelColorRestrictionOptionRules with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelColorRestrictionOptionRule}',
    TypeNamePlural: '{i18n>ModelColorRestrictionOptionRules}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    }
}};
