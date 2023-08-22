using {retail.dwb as db} from '../../../../db';

annotate db.ModelEquipmentPackageContents with {
    package    @title: '{i18n>ModelEquipment}';
    equipment  @title: '{i18n>Equipment}';
    place      @title: '{i18n>ModelEquipmentPackageContents.place}';
    createdAt  @title: '{i18n>replicated.createdAt}';
};

annotate db.ModelEquipmentPackageContents with @Common.SemanticKey: [
    package_model_id,
    package_equipment_id,
    equipment_id
];

annotate db.ModelEquipmentPackageContents with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelEquipmentPackageContent}',
    TypeNamePlural: '{i18n>ModelEquipmentPackageContents}',
    Title         : {
        $Type: 'UI.DataField',
        Value: equipment_id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: equipment.name
    }
}};