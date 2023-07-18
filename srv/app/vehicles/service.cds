using {retail.dwb as db} from '../../../db';

@path: '/app/backend/vehicles'
service AppVehiclesService {
    entity Vehicles          as projection on db.Vehicles;
    entity VehicleEquipments as projection on db.VehicleEquipments;
}
