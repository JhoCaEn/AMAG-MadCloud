namespace retail.dwb;

using {retail.dwb as db} from '../../../db';
using {replicated} from '../../../db';

entity ModelColorCombinationSalesPrices : replicated {
    key colorCombination    : db.ModelColorCombination @assert.integrity: false;
    key type                : db.ColorType             @assert.integrity: false;
    key constraintEquipment : db.Equipment             @assert.integrity: false;
    key constraintColor     : db.Color                 @assert.integrity: false;
    key validFrom           : Date default '1970-01-01';
        validTo             : Date default '9999-12-31';
        value               : Decimal(11, 2);
        currency            : String(5);
        weighting           : Integer;
};

type ModelColorCombinationSalesPrice : Association to ModelColorCombinationSalesPrices;

entity CurrentModelColorCombinationSalesPrices as projection on ModelColorCombinationSalesPrices {
    key colorCombination.model,
    key colorCombination.exterior,
    key colorCombination.interior,
    key colorCombination.roof,
    key type,
    key constraintEquipment,
    key constraintColor,
        value,
        currency,
        weighting
} where $now between validFrom and validTo;

entity CurrentModelColorCombinationExteriorSalesPrices as projection on CurrentModelColorCombinationSalesPrices {
    key model,
    key exterior,
    key interior,
    key roof,
    key constraintEquipment,
    key constraintColor,
        value,
        currency,
        weighting
} where type.code = 'E';

entity CurrentModelColorCombinationInteriorSalesPrices as projection on CurrentModelColorCombinationSalesPrices {
    key model,
    key exterior,
    key interior,
    key roof,
    key constraintEquipment,
    key constraintColor,
        value,
        currency,
        weighting
} where type.code = 'I';

entity CurrentModelColorCombinationRoofSalesPrices as projection on CurrentModelColorCombinationSalesPrices {
    key model,
    key exterior,
    key interior,
    key roof,
    key constraintEquipment,
    key constraintColor,
        value,
        currency,
        weighting
} where type.code = 'R';