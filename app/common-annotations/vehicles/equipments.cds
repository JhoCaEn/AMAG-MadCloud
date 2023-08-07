using {retail.dwb as db} from '../../../db';

annotate db.VehicleEquipments with {
    vehicle                       @title: '{i18n>Vehicle}';
    equipment                     @title: '{i18n>Equipment}';
    salesPriceConstraintEquipment @title: '{i18n>Vehicles.salesPriceConstraintEquipment}';
    salesPriceConstraintColor     @title: '{i18n>Vehicles.salesPriceConstraintColor}';
};

annotate db.VehicleEquipments with @Common.SemanticKey: [
    vehicle_ID,
    equipment_id
];

annotate db.VehicleEquipments with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Equipment}',
    TypeNamePlural: '{i18n>Equipments}',
    Title         : {
        $Type: 'UI.DataField',
        Value: equipment_id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: vehicle_ID
    }
}};


annotate db.VehicleEquipmentsView with {
    vehicle                       @title: '{i18n>Vehicle}';
    equipment                     @title: '{i18n>Equipment}';
    model                         @title: '{i18n>Model}';
    salesPriceConstraintEquipment @title: '{i18n>Vehicles.salesPriceConstraintEquipment}';
    salesPriceConstraintColor     @title: '{i18n>Vehicles.salesPriceConstraintColor}';
    salesPrice                    @title: '{i18n>VehicleEquipments.salesPrice}';
};

annotate db.VehicleEquipmentsView with @Common.SemanticKey: [
    vehicle_ID,
    equipment_id
];

annotate db.VehicleEquipmentsView with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Equipment}',
    TypeNamePlural: '{i18n>Equipments}',
    Title         : {
        $Type: 'UI.DataField',
        Value: equipment_id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: vehicle_ID
    }
}};
