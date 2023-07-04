using {retail.dwb as db} from '../../../../db';


@protocol: 'none'
service ReplicationMasterdataFuelTypeService {

    action replicate(brand : db.Brand:code, id : db.FuelType:id)
}
