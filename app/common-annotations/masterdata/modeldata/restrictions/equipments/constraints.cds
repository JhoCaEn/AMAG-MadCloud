using {retail.dwb as db} from '../../../../../../db';

annotate db.ModelEquipmentRestrictionConstraints with {
    equipment  @title: '{i18n>Equipment}';
};

annotate db.ModelEquipmentRestrictionConstraints with @Common.SemanticKey: [
    equipment_id,
    restriction_equipment_equipment_id,
    restriction_constraint
];
