using {retail.dwb as db} from '../../../../../../db';

annotate db.ModelEquipmentRestrictions with {
    equipment  @title: '{i18n>Equipment}';
    constraint @title: '{i18n>ModelEquipmentRestrictions.Constraint}';
};

annotate db.ModelEquipmentRestrictions with @Common.SemanticKey: [
    equipment_equipment_id,
    constraint
];

annotate db.ModelEquipmentRestrictions with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Restriction}',
    TypeNamePlural: '{i18n>Restrictions}',
    Title         : {
        $Type: 'UI.DataField',
        Value: constraint
    }
}};