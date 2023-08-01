namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity VehicleEquipments {
    key vehicle                       : db.Vehicle   @assert.integrity: false;
    key equipment                     : db.Equipment @assert.integrity: false;
        salesPriceConstraintEquipment : db.Equipment @assert.integrity: false;
        salesPriceConstraintColor     : db.Color     @assert.integrity: false;
}

entity VehicleEquipmentsView as projection on VehicleEquipments {
    key vehicle,
    key equipment,
        vehicle.model,
        salesPriceConstraintEquipment,
        salesPriceConstraintColor,
        salesPrice : Association to one db.ModelEquipmentSalesPrices on salesPrice.equipment.model     =       model
                     and                                                salesPrice.equipment.equipment =       equipment
                     and                                                salesPrice.constraintEquipment =       salesPriceConstraintEquipment
                     and                                                salesPrice.constraintColor     =       salesPriceConstraintColor
                     and                                                current_date                   between salesPrice.validFrom and salesPrice.validTo
}

type VehicleEquipment : Association to VehicleEquipments;
