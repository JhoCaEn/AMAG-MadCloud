using AppBackofficeBrandsService as service from '.';

annotate service.BrandCharacteristics actions {
    synchroniseCharacteristic @Common.SideEffects: {
        TargetProperties: ['in']
    };
}

annotate service.ModelSeries actions {
    synchroniseModelSeries @Common.SideEffects: {
        TargetProperties: ['in'],
        TargetEntities  : ['in/texts']
    };
}

annotate service.SalesTypes actions {
    synchroniseSalesType @Common.SideEffects: {
        TargetProperties: ['in'],
        TargetEntities  : ['in/texts']
    };
}

annotate service.BodyTypes actions {
    synchroniseBodyType @Common.SideEffects: {
        TargetProperties: ['in'],
        TargetEntities  : ['in/texts']
    };
}

annotate service.FuelTypes actions {
    synchroniseFuelType @Common.SideEffects: {
        TargetProperties: ['in'],
        TargetEntities  : ['in/texts']
    };
}

annotate service.DriveTypes actions {
    synchroniseDriveType @Common.SideEffects: {
        TargetProperties: ['in'],
        TargetEntities  : ['in/texts']
    };
}

annotate service.TransmissionTypes actions {
    synchroniseTransmissionType @Common.SideEffects: {
        TargetProperties: ['in'],
        TargetEntities  : ['in/texts']
    };
}

annotate service.EquipmentChapters actions {
    synchroniseEquipmentChapter @Common.SideEffects: {
        TargetProperties: ['in'],
        TargetEntities  : ['in/texts']
    };
}

annotate service.EquipmentCategories actions {
    synchroniseEquipmentCategory @Common.SideEffects: {
        TargetProperties: ['in'],
        TargetEntities  : ['in/texts']
    };
}
