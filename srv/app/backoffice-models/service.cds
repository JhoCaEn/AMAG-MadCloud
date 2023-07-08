using {retail.dwb as db} from '../../../db';
using {sap.common.Languages as Languages} from '@sap/cds/common';

@path: '/app/backend/backoffice/models'
service AppBackofficeModelsService {

    @readonly
    entity Models                as projection on db.Models {
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
    entity Models.texts          as projection on db.Models.texts;

    extend projection Models.texts with {
        language : Association to one Languages on language.code = locale
    }

    @readonly
    entity ModelRestrictionRules as projection on db.ModelRestrictionRules {
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
    entity EquipmentCategories   as projection on db.EquipmentCategories {
        id,
        brand,
        name
    };
    
    @readonly
    entity Equipments            as projection on db.Equipments {
        id,
        brand,
        name
    }
    entity ModelSalesPrices as projection on db.ModelSalesPrices {
        model, 
        validFrom,
        validTo, 
        value, 
        modifiedAt,
        currency
    };

    @readonly
    entity ModelColors as projection on db.ModelColors {
        model,
        color,
        modifiedAt
    };

    @readonly
    entity Colors as projection on db.Colors ;

    entity ModelRestrictions as projection on db.ModelRestrictions {
        model, 
        id,
        modifiedAt,
        rules
    };

    @readonly
    entity ModelColorCombinations as projection on db.ModelColorCombinations {
        model,
        exterior, 
        interior, 
        roof,
        restrictions
    };

    @readonly
    entity ModelColorRestrictions as projection on db.ModelColorRestrictions {
        colorCombination,
        type,
        constraint,
        constraints,
        options
    };

    @readonly
    entity ModelColorRestrictionConstraints as projection on db.ModelColorRestrictionConstraints {
        restriction,
        equipment
    };


    @readonly
    entity ModelColorRestrictionOptions as projection on db.ModelColorRestrictionOptions {
        restriction,
        id
    };

    @readonly
    entity ModelEquipments as projection on db.ModelEquipments {
        model,
        equipment,
        isStandard,
        isPackage,
        packageContent
    };

    @readonly
    entity ModelEquipmentPackageContents as projection on db.ModelEquipmentPackageContents;

}