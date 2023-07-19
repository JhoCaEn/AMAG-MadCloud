using {retail.dwb as db} from '../../../db';
using {sap.common.Languages as Languages} from '@sap/cds/common';

@path: '/app/backend/backoffice/models'
service AppBackofficeModelsService {

    @readonly
    entity Models                               as projection on db.Models {
        id,
        name,
        year,
        code,
        technicalKey,
        releasedForPartner,
        releasedForImporteur,
        validFrom,
        validTo,
        orderableFrom,
        orderableTo,
        isNetSalesPrices,
        isOEMBuildableCheckActive,
        brand,
        category,
        salesType                                        @cds.api.ignore,
        salesType.id                 as salesTypeId,
        salesType.material,
        salesType.salesOrganisation,
        engine,
        engine.capacity              as engineCapacity,
        engine.powerHP               as enginePowerHP,
        engine.powerKW               as enginePowerKW,
        engine.cylinders             as engineCylinders,
        engine.fuelType                                  @cds.api.ignore,
        engine.fuelType.id           as fuelTypeId,
        engine.fuelType.unit         as fuelTypeUnit,
        transmission,
        transmission.gears           as transmissionGears,
        transmission.type            as transmissionType @cds.api.ignore,
        transmission.type.id         as transmissionTypeId,
        transmission.type.shift      as transmissionShift,
        transmission.driveType                           @cds.api.ignore,
        transmission.driveType.id    as driveTypeId,
        transmission.driveType.train as driveTypeTrain,
        bodyType                                         @cds.api.ignore,
        bodyType.id                  as bodyTypeId,
        colors,
        colorCombinations,
        equipments,
        salesPrices,
        restrictions,
        createdAt,
        modifiedAt,
        texts
    } actions {
        action synchronise(in : $self);
    }

    extend projection Models with {
        exteriorColors     : Association to many ModelExteriorColors on exteriorColors.model = $self,
        interiorColors     : Association to many ModelInteriorColors on interiorColors.model = $self,
        roofColors         : Association to many ModelRoofColors on roofColors.model = $self,
        standardEquipments : Association to many ModelStandardEquipments on standardEquipments.model = $self,
        extraEquipments    : Association to many ModelExtraEquipments on extraEquipments.model = $self,
    }

    @readonly
    entity Models.texts                         as projection on db.Models.texts;

    extend projection Models.texts with {
        language : Association to one Languages on language.code = locale
    }

    entity ModelSalesPrices                     as projection on db.ModelSalesPrices {
        model,
        validFrom,
        validTo,
        value,
        currency,
        createdAt
    };

    entity ModelRestrictions                    as projection on db.ModelRestrictions {
        model,
        id,
        rules,
        createdAt
    };

    @readonly
    entity ModelRestrictionRules                as projection on db.ModelRestrictionRules {
        restriction,
        id,
        category @cds.api.ignore,
        category.id as categoryId,
        color,
        equipment,
        isRequired,
        isForbidden,
        createdAt
    };

    @readonly
    entity ModelColors                          as projection on db.ModelColors {
        model,
        color,
        color.id,
        color.type,
        color.displayName,
        validFrom,
        validTo,
        orderableFrom,
        orderableTo,
        createdAt
    };

    @readonly
    entity ModelExteriorColors                  as projection on ModelColors excluding {
        type
    } where type.code = 'E';

    @readonly
    entity ModelInteriorColors                  as projection on ModelColors excluding {
        type
    } where type.code = 'I';

    @readonly
    entity ModelRoofColors                      as projection on ModelColors excluding {
        type
    } where type.code = 'R';

    @readonly
    entity ModelColorCombinations               as projection on db.ModelColorCombinations {
        model,
        exterior,
        interior,
        roof,
        case
            when
                length(
                    exterior.id
                ) > 0
            then
                exterior.id
            else
                ' '
        end                  as exteriorId : String,
        case
            when
                length(
                    interior.id
                ) > 0
            then
                interior.id
            else
                ' '
        end                  as interiorId : String,
        case
            when
                length(
                    roof.id
                ) > 0
            then
                roof.id
            else
                ' '
        end                  as roofId     : String,
        exterior.displayName as exteriorDisplayName,
        interior.displayName as interiorDisplayName,
        roof.displayName     as roofDisplayName,
        validFrom,
        validTo,
        orderableFrom,
        orderableTo,
        createdAt,
        restrictions
    };

    @readonly
    entity ModelColorRestrictions               as projection on db.ModelColorRestrictions {
        colorCombination,
        type,
        constraint,
        createdAt,
        constraints,
        options
    };

    @readonly
    entity ModelColorRestrictionConstraints     as projection on db.ModelColorRestrictionConstraints {
        restriction,
        equipment,
        equipment.id,
        equipment.displayName
    };

    @readonly
    entity ModelColorRestrictionOptions         as projection on db.ModelColorRestrictionOptions {
        restriction,
        id,
        createdAt,
        rules
    };

    @readonly
    entity ModelColorRestrictionOptionRules     as projection on db.ModelColorRestrictionOptionRules {
        option,
        id,
        category @cds.api.ignore,
        category.id as categoryId,
        color,
        equipment,
        isRequired,
        isForbidden,
        createdAt
    }

    @readonly
    entity ModelEquipments                      as projection on db.ModelEquipments {
        model,
        equipment,
        equipment.id,
        equipment.displayName,
        equipment.category @cds.api.ignore,
        equipment.category.id as categoryId,
        equipment.chapter  @cds.api.ignore,
        equipment.chapter.id  as chapterId,
        isStandard,
        isPackage,
        validFrom,
        validTo,
        orderableFrom,
        orderableTo,
        createdAt,
        equipment.chapter.isVisible,
        equipment.chapter.isVisibleInConfigurator,
        equipment.chapter.isVisibleInSellingSystem,
        packageContent,
        restrictions
    } where(
           equipment.chapter.isVisible                = true
        or equipment.chapter.isVisibleInConfigurator  = true
        or equipment.chapter.isVisibleInSellingSystem = true
    );

    @readonly
    entity ModelStandardEquipments              as projection on ModelEquipments excluding {
        isStandard
    } where isStandard = true;

    @readonly
    entity ModelExtraEquipments                 as projection on ModelEquipments excluding {
        isStandard
    } where isStandard = false;

    @readonly
    entity ModelEquipmentPackageContents        as projection on db.ModelEquipmentPackageContents {
        package,
        equipment,
        equipment.id,
        equipment.displayName,
        place,
        createdAt
    };

    @readonly
    entity ModelEquipmentRestrictions           as projection on db.ModelEquipmentRestrictions {
        equipment,
        constraint,
        case
            when
                length(constraint) > 0
            then
                constraint
            else
                ' '
        end as constraintDisplay : String,
        createdAt,
        constraints,
        options
    };

    @readonly
    entity ModelEquipmentRestrictionConstraints as projection on db.ModelEquipmentRestrictionConstraints {
        restriction,
        equipment,
        equipment.id,
        equipment.displayName
    };

    @readonly
    entity ModelEquipmentRestrictionOptions     as projection on db.ModelEquipmentRestrictionOptions {
        restriction,
        id,
        createdAt,
        rules
    };

    @readonly
    entity ModelEquipmentRestrictionOptionRules as projection on db.ModelEquipmentRestrictionOptionRules {
        option,
        id,
        category @cds.api.ignore,
        category.id as categoryId,
        color,
        equipment,
        isRequired,
        isForbidden,
        createdAt
    };

    @readonly
    entity Colors                               as projection on db.Colors {
        id,
        brand,
        type,
        displayName
    };

    @readonly
    entity ColorTypes                           as projection on db.ColorTypes {
        code,
        name
    };

    @readonly
    entity Equipments                           as projection on db.Equipments {
        id,
        brand,
        chapter  @cds.api.ignore,
        chapter.id  as chapterId,
        category @cds.api.ignore,
        category.id as categoryId,
        displayName
    }

    @readonly
    entity EquipmentCategories                  as projection on db.EquipmentCategories {
        brand,
        id,
        name
    };

    @readonly
    entity EquipmentChapters                    as projection on db.EquipmentChapters {
        brand,
        id,
        name
    } where(
           isVisible                = true
        or isVisibleInConfigurator  = true
        or isVisibleInSellingSystem = true
    );

    @readonly
    entity BodyTypes                            as projection on db.BodyTypes {
        brand,
        id,
        name
    };

    @readonly
    entity SalesTypes                           as projection on db.SalesTypes {
        brand,
        id,
        material,
        salesOrganisation,
        name
    };

    @readonly
    entity Engines                              as projection on db.Engines {
        id,
        brand,
        capacity,
        powerHP,
        powerKW,
        cylinders,
        fuelType.id as fuelTypeId,
        fuelType.unit,
        fuelType @cds.api.ignore,
        name
    };

    @readonly
    entity Transmissions                        as projection on db.Transmissions {
        id,
        brand,
        gears,
        type.id      as typeId,
        type.shift,
        type      @cds.api.ignore,
        driveType.id as driveTypeId,
        driveType.train,
        driveType @cds.api.ignore,
        name
    };

    @readonly
    entity Brands                               as projection on db.Brands {
        code,
        name
    }

    @readonly
    entity ModelCategories                      as projection on db.ModelCategories {
        code,
        name
    }

    @readonly
    entity DriveTypes                           as projection on db.DriveTypes {
        brand,
        id,
        train,
        name
    }

    @readonly
    entity TransmissionTypes                    as projection on db.TransmissionTypes {
        brand,
        id,
        shift,
        name
    }

    @readonly
    entity TransmissionShifts                   as projection on db.TransmissionShifts {
        code,
        name
    }

    @readonly
    entity DriveTrains                          as projection on db.DriveTrains {
        code,
        name
    }

    @readonly
    entity FuelTypes                            as projection on db.FuelTypes {
        brand,
        id,
        unit,
        name
    }
}
