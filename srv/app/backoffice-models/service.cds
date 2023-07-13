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
        engine,
        transmission,
        salesPrices,
        colors,
        colorCombinations,
        equipments,
        restrictions,
        modifiedAt,
        texts
    } actions {
        action synchronise(in : $self);
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
        currency
    };

    @readonly
    entity ModelColors                          as projection on db.ModelColors {
        model,
        color,
        color.id,
        color.type,
        modifiedAt
    };

    @readonly
    entity Colors                               as projection on db.Colors;

    @readonly
    entity ColorTypes                           as projection on db.ColorTypes;

    entity ModelRestrictions                    as projection on db.ModelRestrictions {
        model,
        id,
        modifiedAt,
        rules
    };

    @readonly
    entity ModelColorCombinations               as projection on db.ModelColorCombinations {
        model,
        exterior,
        interior,
        roof,
        restrictions
    };

    @readonly
    entity ModelColorRestrictions               as projection on db.ModelColorRestrictions {
        colorCombination,
        type,
        constraint,
        constraints,
        options
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
        id
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
}
