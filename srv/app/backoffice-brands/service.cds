using {retail.dwb as db} from '../../../db';
using {sap.common.Languages as Languages} from '@sap/cds/common';

@path: '/app/backend/backoffice/brands'
service AppBackofficeBrandsService {
    @readonly
    entity Brands                    as projection on db.Brands {
        code,
        distributionChannel,
        organizationDivision,
        name,
        texts,
        modelSeries,
        salesTypes,
        bodyTypes,
        fuelTypes,
        driveTypes,
        transmissionTypes,
        equipmentChapters,
        equipmentCategories,
        characteristics
    };

    @readonly
    entity Brands.texts              as projection on db.Brands.texts

    extend projection Brands.texts with {
        language : Association to one Languages on language.code = locale
    };

    @readonly
    entity BrandCharacteristics      as projection on db.BrandCharacteristics {
        brand,
        characteristic,
        value,
        modifiedAt,
        createdAt
    } actions {
        action synchroniseCharacteristic(in : $self);
    }

    @readonly
    entity ModelSeries               as projection on db.ModelSeries {
        brand,
        id,
        name,
        createdAt,
        modifiedAt,
        texts,
        salesTypes
    } actions {
        action synchroniseModelSeries(in : $self);
    };

    @readonly
    entity ModelSeries.texts         as projection on db.ModelSeries.texts;

    extend projection ModelSeries.texts with {
        language : Association to one Languages on language.code = locale
    };

    @readonly
    entity SalesTypes                as projection on db.SalesTypes {
        brand,
        id,
        name,
        material,
        salesOrganisation,
        createdAt,
        modifiedAt,
        texts,
        modelSeries
    } actions {
        action synchroniseSalesType(in : $self);
    };

    @readonly
    entity SalesTypes.texts          as projection on db.SalesTypes.texts;

    extend projection SalesTypes.texts with {
        language : Association to one Languages on language.code = locale
    };

    @readonly
    entity BodyTypes                 as projection on db.BodyTypes {
        brand,
        id,
        name,
        createdAt,
        modifiedAt,
        texts,
        models
    } actions {
        action synchroniseBodyType(in : $self);
    };

    @readonly
    entity BodyTypes.texts           as projection on db.BodyTypes.texts;

    extend projection BodyTypes.texts with {
        language : Association to one Languages on language.code = locale
    };

    @readonly
    entity FuelTypes                 as projection on db.FuelTypes {
        brand,
        id,
        unit,
        name,
        createdAt,
        modifiedAt,
        texts,
        engines
    } actions {
        action synchroniseFuelType(in : $self);
    };

    @readonly
    entity FuelTypes.texts           as projection on db.FuelTypes.texts;

    extend projection FuelTypes.texts with {
        language : Association to one Languages on language.code = locale
    };

    @readonly
    entity DriveTypes                as projection on db.DriveTypes {
        brand,
        id,
        train,
        name,
        createdAt,
        modifiedAt,
        texts,
        transmissions
    } actions {
        action synchroniseDriveType(in : $self);
    };

    @readonly
    entity DriveTypes.texts          as projection on db.DriveTypes.texts;

    extend projection DriveTypes.texts with {
        language : Association to one Languages on language.code = locale
    };

    @readonly
    entity DriveTrains               as projection on db.DriveTrains {
        code,
        name
    }

    @readonly
    entity TransmissionTypes         as projection on db.TransmissionTypes {
        brand,
        id,
        shift,
        name,
        createdAt,
        modifiedAt,
        texts,
        transmissions
    } actions {
        action synchroniseTransmissionType(in : $self);
    };

    @readonly
    entity TransmissionTypes.texts   as projection on db.TransmissionTypes.texts;

    extend projection TransmissionTypes.texts with {
        language : Association to one Languages on language.code = locale
    };

    @readonly
    entity TransmissionShifts        as projection on db.TransmissionShifts {
        code,
        name
    }

    @readonly
    entity EquipmentChapters         as projection on db.EquipmentChapters {
        brand,
        id,
        characteristicName,
        name,
        isVisible,
        isVisibleInConfigurator,
        isVisibleInSellingSystem,
        createdAt,
        modifiedAt,
        texts,
        equipments
    } actions {
        action synchroniseEquipmentChapter(in : $self);
    };

    @readonly
    entity EquipmentChapters.texts   as projection on db.EquipmentChapters.texts;

    extend projection EquipmentChapters.texts with {
        language : Association to one Languages on language.code = locale
    };

    @readonly
    entity EquipmentCategories       as projection on db.EquipmentCategories {
        brand,
        id,
        name,
        createdAt,
        modifiedAt,
        texts,
        equipments
    } actions {
        action synchroniseEquipmentCategory(in : $self);
    };

    @readonly
    entity EquipmentCategories.texts as projection on db.EquipmentCategories.texts;

    extend projection EquipmentCategories.texts with {
        language : Association to one Languages on language.code = locale
    };

    @readonly
    entity Transmissions             as projection on db.Transmissions {
        id,
        name,
        type,
        driveType
    }

    @readonly
    entity Models                    as projection on db.Models {
        code,
        year,
        name,
        bodyType
    }

    @readonly
    entity Engines                   as projection on db.Engines {
        id,
        name,
        fuelType
    }

    @readonly
    entity Equipments                as projection on db.Equipments {
        id,
        name,
        chapter,
        category
    }
}
