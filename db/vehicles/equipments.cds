namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity VehicleEquipments {
    key vehicle                       : db.Vehicle   @assert.integrity: false;
    key equipment                     : db.Equipment @assert.integrity: false;
        salesPriceConstraintEquipment : db.Equipment @assert.integrity: false;
        salesPriceConstraintColor     : db.Color     @assert.integrity: false;
        salesPrice                    : Association to one VehicleEquipmentSalesPrices
                                            on  salesPrice.vehicle   = vehicle
                                            and salesPrice.equipment = equipment
}

entity VehicleEquipmentSalesPricesPrepare as projection on VehicleEquipments {
    key vehicle,
    key equipment,
        vehicle.model,
        salesPriceConstraintEquipment as constraintEquipment,
        salesPriceConstraintColor     as constraintColor
}

entity VehicleEquipmentSalesPrices        as
    select from VehicleEquipmentSalesPricesPrepare as e
    inner join db.ModelEquipmentSalesPrices as p
        on  p.equipment.model     =       e.model
        and p.equipment.equipment =       e.equipment
        and p.constraintEquipment =       e.constraintEquipment
        and p.constraintColor     =       e.constraintColor
        and current_date          between p.validFrom and p.validTo
    {
        key e.vehicle,
        key e.equipment,
            p.value,
            p.currency
    };

type VehicleEquipment : Association to VehicleEquipments;
