namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity VehicleEquipments {
    key vehicle   : db.Vehicle   @assert.integrity: false;
    key equipment : db.Equipment @assert.integrity: false;
}

type VehicleEquipment: Association to VehicleEquipments;