using {retail.dwb as db} from '../../../../../../db';

annotate db.ModelEquipmentRestrictions with {
    equipment  @title: '{i18n>Equipment}';
    constraint @title: '{i18n>Constraint}';
    createdAt  @title: '{i18n>replicated.createdAt}';
};

annotate db.ModelEquipmentRestrictions with @Common.SemanticKey: [
    equipment_equipment_id,
    constraint
];

annotate db.ModelEquipmentRestrictions with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelEquipmentRestriction}',
    TypeNamePlural: '{i18n>ModelEquipmentRestrictions}',
    Title         : {
        $Type: 'UI.DataField',
        Value: constraint
    }
}};
