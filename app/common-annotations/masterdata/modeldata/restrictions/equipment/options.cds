using {retail.dwb as db} from '../../../../../../db';

annotate db.ModelEquipmentRestrictionOptions with {
    restriction @title: '{i18n>ModelEquipmentRestriction}';
    id          @title: '{i18n>General.ID}';
    createdAt   @title: '{i18n>replicated.createdAt}';
};

annotate db.ModelEquipmentRestrictionOptions with @Common.SemanticKey: [
    restriction_equipment_model_id,
    restriction_equipment_equipment_id,
    restriction_constraint,
    id
];

annotate db.ModelEquipmentRestrictionOptions with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelEquipmentRestrictionOption}',
    TypeNamePlural: '{i18n>ModelEquipmentRestrictionOptions}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    }
}};
