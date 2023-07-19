using {retail.dwb as db} from '../../../../../../db';

annotate db.ModelEquipmentRestrictionOptionRules with {
    option      @title: '{i18n>ModelEquipmentRestrictionOption}';
    id          @title: '{i18n>General.ID}';
    category    @title: '{i18n>EquipmentCategory}';
    color       @title: '{i18n>Color}';
    equipment   @title: '{i18n>Equipment}';
    isRequired  @title: '{i18n>RestrictionRules.isRequired}';
    isForbidden @title: '{i18n>RestrictionRules.isForbidden}';
    createdAt   @title: '{i18n>replicated.createdAt}';
    modifiedAt  @title: '{i18n>replicated.modifiedAt}';
};

annotate db.ModelEquipmentRestrictionOptionRules with @Common.SemanticKey: [
    option_restriction_equipment_model_id,
    option_restriction_equipment_equipment_id,
    option_restriction_constraint,
    option_id,
    id
];

annotate db.ModelEquipmentRestrictionOptionRules with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelEquipmentRestrictionOptionRule}',
    TypeNamePlural: '{i18n>ModelEquipmentRestrictionOptionRules}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    }
}};
