using {retail.dwb as db} from '../../../../../../db';

annotate db.ModelColorRestrictionConstraints with {
    restriction @title: '{i18n>ModelColorCombinationRestriction}';
    equipment   @title: '{i18n>Equipment}';
    createdAt   @title: '{i18n>replicated.createdAt}';
};

annotate db.ModelColorRestrictionConstraints with @Common.SemanticKey: [
    restriction_colorCombination_model_id,
    restriction_colorCombination_exterior_id,
    restriction_colorCombination_interior_id,
    restriction_colorCombination_roof_id,
    restriction_type_code,
    restriction_constraint,
    equipment_id
];

annotate db.ModelColorRestrictionConstraints with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelColorRestrictionConstraint}',
    TypeNamePlural: '{i18n>ModelColorRestrictionConstraints}',
    Title         : {
        $Type: 'UI.DataField',
        Value: equipment_id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: equipment.displayName
    }
}};
