namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity CarConfigurationEquipments {
    key configuration                 : db.CarConfiguration;
    key equipment                     : db.Equipment;
        salesPriceConstraintEquipment : db.Equipment @assert.integrity: false;
        salesPriceConstraintColor     : db.Color     @assert.integrity: false;
}

entity CarConfigurationEquipmentsView as projection on CarConfigurationEquipments {
    key configuration,
    key equipment,
        configuration.model,
        salesPriceConstraintEquipment,
        salesPriceConstraintColor,
        salesPrice : Association to one db.ModelEquipmentSalesPrices on salesPrice.equipment.model     =       model
                     and                                                salesPrice.equipment.equipment =       equipment
                     and                                                salesPrice.constraintEquipment =       salesPriceConstraintEquipment
                     and                                                salesPrice.constraintColor     =       salesPriceConstraintColor
                     and                                                current_date                   between salesPrice.validFrom and salesPrice.validTo
}
