using {retail.dwb as db} from '../../../../db';

annotate db.ModelEquipments with {
    equipment  @title: '{i18n>Equipment}';
    isStandard @title: '{i18n>ModelEquipments.isStandard}';
    isPackage @title: '{i18n>ModelEquipments.isPackage}';
};

annotate db.ModelEquipments with @Common.SemanticKey: [
    model_id,
    equipment_id
];

annotate db.ModelEquipments with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Equipment}',
    TypeNamePlural: '{i18n>Equipments}',
    Title         : {
        $Type: 'UI.DataField',
        Value: equipment_id
    }
}};