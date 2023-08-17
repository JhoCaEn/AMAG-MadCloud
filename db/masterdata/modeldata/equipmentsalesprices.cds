namespace retail.dwb;

using {retail.dwb as db} from '../../../db';
using {replicated} from '../../../db';
using {replicatedComposition} from '../../../db';
using {
    SalesPriceValue,
    SalesPriceCurrency
} from '../../../db';

entity ModelEquipmentSalesPrices : replicatedComposition {
    key equipment           : db.ModelEquipment @assert.integrity: false;
    key constraintEquipment : db.Equipment      @assert.integrity: false;
    key constraintColor     : db.Color          @assert.integrity: false;
    key validFrom           : Date default '1970-01-01';
        validTo             : Date default '9999-12-31';
        value               : SalesPriceValue;
        currency            : SalesPriceCurrency;
        weighting           : Integer;
};

type ModelEquipmentSalesPrice : Association to ModelEquipmentSalesPrices;

entity CurrentModelEquipmentSalesPrices as projection on ModelEquipmentSalesPrices {
    key equipment.model,
    key equipment.equipment,
    key constraintEquipment,
    key constraintColor,
        value,
        currency,
        weighting
} where $now between validFrom and validTo;
