using {retail.dwb as db} from '../../../../db';

annotate db.ModelEquipments with {
    model         @title: '{i18n>Model}';
    equipment     @title: '{i18n>Equipment}';
    isStandard    @title: '{i18n>ModelEquipments.isStandard}';
    isPackage     @title: '{i18n>ModelEquipments.isPackage}';
    validFrom     @title: '{i18n>General.validFrom}';
    validTo       @title: '{i18n>General.validTo}';
    orderableFrom @title: '{i18n>orderableFrom}';
    orderableTo   @title: '{i18n>orderableTo}';
};


annotate db.ModelEquipments with @Common.SemanticKey: [
    model_id,
    equipment_id
];

annotate db.ModelEquipments with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelEquipment}',
    TypeNamePlural: '{i18n>ModelEquipments}',
    Title         : {
        $Type: 'UI.DataField',
        Value: equipment_id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: equipment.name
    }
}};
