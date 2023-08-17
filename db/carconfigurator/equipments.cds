namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {
    SalesPriceValue,
    SalesPriceCurrency
} from '../../db';

entity CarConfigurationEquipments {
    key configuration                 : db.CarConfiguration;
    key equipment                     : db.Equipment;
        salesPriceConstraintEquipment : db.Equipment @assert.integrity: false;
        salesPriceConstraintColor     : db.Color     @assert.integrity: false;
        salesPriceValue               : SalesPriceValue;
        salesPriceValueCurrency       : SalesPriceCurrency;

        salesPrice                    : Association to one CarConfigurationEquipmentSalesPrices
                                            on  salesPrice.configuration = configuration
                                            and salesPrice.equipment     = equipment
}

entity CarConfigurationEquipmentSalesPricesPrepare as projection on CarConfigurationEquipments {
    key configuration,
    key equipment,
        configuration.model,
        salesPriceConstraintEquipment as constraintEquipment,
        salesPriceConstraintColor     as constraintColor
}

entity CarConfigurationEquipmentSalesPrices        as
    select from CarConfigurationEquipmentSalesPricesPrepare as e
    inner join db.CurrentModelEquipmentSalesPrices as p
        on  p.model               = e.model
        and p.equipment           = e.equipment
        and p.constraintEquipment = e.constraintEquipment
        and p.constraintColor     = e.constraintColor
    {
        key e.configuration,
        key e.equipment,
            p.value,
            p.currency
    };
