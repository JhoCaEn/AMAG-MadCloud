namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity VehicleEquipments {
    vehicle   : db.Vehicle   @assert.integrity: false;
    equipment : db.Equipment @assert.integrity: false;
}

type VehicleEquipment: Association to VehicleEquipments;