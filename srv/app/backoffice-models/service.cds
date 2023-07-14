using {retail.dwb as db} from '../../../db';
using {sap.common.Languages as Languages} from '@sap/cds/common';

@path: '/app/backend/backoffice/models'
service AppBackofficeModelsService {

    @readonly
    entity Models                               as projection on db.Models {
        id,
        year,
        code,
        brand,
        name,
        technicalKey,
        releasedForPartner,
        releasedForImporteur,
        validFrom,
        validTo,
        orderableFrom,
        orderableTo,
        isNetSalesPrices,
        isOEMBuildableCheckActive,
        category,
        salesPrices,
        colors,
        colorCombinations,
        equipments,
        restrictions,
        createdAt,
        modifiedAt,
        texts,
        engine,
        transmission,
        bodyType @cds.api.ignore,
        bodyType.id as bodyTypeId,
        salesType @cds.api.ignore,
        salesType.id as salesTypeId,
        modelSeries @cds.api.ignore,
        modelSeries.id as modelSeriesId
    } actions {
        action synchroniseModels(in : $self);
    }

    @readonly
    entity Models.texts                         as projection on db.Models.texts;

    extend projection Models.texts with {
        language : Association to one Languages on language.code = locale
    }

    @readonly
    entity ModelRestrictionRules                as projection on db.ModelRestrictionRules {
        id,
        isForbidden,
        isRequired,
        createdAt,
        modifiedAt,
        category,
        color,
        equipment,
        restriction
    };

    @readonly
    @cds.redirection.target
    entity EquipmentCategories                  as projection on db.EquipmentCategories {
        id,
        brand,
        name
    };

    @readonly
    entity Equipments                           as projection on db.Equipments {
        id,
        brand,
        name
    }

    entity ModelSalesPrices                     as projection on db.ModelSalesPrices {
        model,
        validFrom,
        validTo,
        value,
        modifiedAt,
        currency,
        createdAt
    };

    @readonly
    entity ModelColors                          as projection on db.ModelColors {
        model,
        color,
        color.id,
        color.type,
        color.displayName,
        createdAt,
        modifiedAt,
        validFrom,
        validTo,
        orderableFrom,
        orderableTo
    };

    @readonly
    entity Colors                           as projection on db.Colors;

    @readonly
    entity ColorTypes                           as projection on db.ColorTypes;

    entity ModelRestrictions                    as projection on db.ModelRestrictions {
        model,
        id,
        modifiedAt,
        createdAt,
        rules
    };

    @readonly
    entity ModelColorCombinations               as projection on db.ModelColorCombinations {
        model,
        exterior,
        interior,
        roof,
        restrictions,
        validFrom,
        validTo,
        orderableFrom,
        orderableTo,
        createdAt,
        modifiedAt
    };

    @readonly
    entity ModelColorRestrictions               as projection on db.ModelColorRestrictions {
        colorCombination,
        type,
        constraint,
        constraints,
        options,
        createdAt, 
        modifiedAt
    };

    @readonly
    entity ModelColorRestrictionConstraints     as projection on db.ModelColorRestrictionConstraints {
        restriction,
        equipment
    };


    @readonly
    entity ModelColorRestrictionOptions         as projection on db.ModelColorRestrictionOptions {
        restriction,
        rules,
        id,
        createdAt,
        modifiedAt
    };

    @readonly
    entity ModelColorRestrictionOptionRules     as projection on db.ModelColorRestrictionOptionRules {
        option,
        id,
        category,
        color,
        equipment,
        isForbidden,
        isRequired
    }

    @readonly
    entity ModelEquipments                      as projection on db.ModelEquipments {
        model,
        equipment,
        equipment.code         as equipmentCode,
        equipment.technicalKey as equipmentTechnicalKey,
        isStandard,
        isPackage,
        validFrom,
        validTo,
        orderableFrom,
        orderableTo,
        packageContent,
        restrictions
    };

    @readonly
    entity ModelEquipmentPackageContents        as projection on db.ModelEquipmentPackageContents;

    @readonly
    entity ModelEquipmentRestrictions           as projection on db.ModelEquipmentRestrictions {
        equipment,
        equipment.equipment.id as equipment_id,
        constraint,
        constraints,
        options
    };

    @readonly
    entity ModelEquipmentRestrictionConstraints as projection on db.ModelEquipmentRestrictionConstraints;

    @readonly
    entity ModelEquipmentRestrictionOptions     as projection on db.ModelEquipmentRestrictionOptions;

    @readonly
    entity ModelEquipmentRestrictionOptionRules as projection on db.ModelEquipmentRestrictionOptionRules {
        option,
        id,
        category @cds.api.ignore,
        category.id as categoryId,
        color,
        equipment,
        isRequired,
        isForbidden
    };

    @readonly
    @cds.redirection.target
    entity BodyTypes as projection on db.BodyTypes;

    @readonly
    entity SalesTypes as projection on db.SalesTypes;

    @readonly
    entity ModelSeries as projection on db.ModelSeries;

    @readonly
    entity Engines as projection on db.Engines;

    @readonly
    entity Transmissions as projection on db.Transmissions;

}
