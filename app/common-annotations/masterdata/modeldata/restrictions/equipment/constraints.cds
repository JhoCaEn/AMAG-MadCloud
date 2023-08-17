using {retail.dwb as db} from '../../../../../../db';

annotate db.ModelEquipmentRestrictionConstraints with {
    restriction @title: '{i18n>ModelEquipmentRestriction}';
    equipment   @title: '{i18n>Equipment}';
    createdAt   @title: '{i18n>replicated.createdAt}';
};

annotate db.ModelEquipmentRestrictionConstraints with @Common.SemanticKey: [
    restriction_equipment_equipment_id,
    restriction_constraint,
    equipment_id
];

annotate db.ModelEquipmentRestrictionConstraints with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelEquipmentRestrictionConstraint}',
    TypeNamePlural: '{i18n>ModelEquipmentRestrictionConstraints}',
    Title         : {
        $Type: 'UI.DataField',
        Value: equipment_id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: equipment.displayName
    }
}};
