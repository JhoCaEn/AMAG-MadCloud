namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {
    SalesPriceValue,
    SalesPriceCurrency
} from '../../db';

entity OfferCarConfigurationEquipments {
    key offer                         : db.Offer;
    key equipment                     : db.Equipment;
        salesPriceConstraintEquipment : db.Equipment;
        salesPriceConstraintColor     : db.Color;
        salesPriceValue               : SalesPriceValue;
        salesPriceValueCurrency       : SalesPriceCurrency;

        salesPrice                    : Association to one OfferCarConfigurationEquipmentSalesPrices
                                            on  salesPrice.offer     = offer
                                            and salesPrice.equipment = equipment
}


entity OfferCarConfigurationEquipmentSalesPricesPrepare as projection on OfferCarConfigurationEquipments {
    key offer,
    key equipment,
        offer.model   as model,
        salesPriceConstraintEquipment as constraintEquipment,
        salesPriceConstraintColor     as constraintColor
}

entity OfferCarConfigurationEquipmentSalesPrices        as
    select from OfferCarConfigurationEquipmentSalesPricesPrepare as e
    inner join db.ModelEquipmentSalesPrices as p
        on  p.equipment.model     =       e.model
        and p.equipment.equipment =       e.equipment
        and p.constraintEquipment =       e.constraintEquipment
        and p.constraintColor     =       e.constraintColor
        and current_date          between p.validFrom and p.validTo
    {
        key e.offer,
        key e.equipment,
            p.value,
            p.currency
    };
