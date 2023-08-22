using {retail.dwb as db} from '../../../../db';

@protocol: 'none'
service ReplicationVehicledataVehicleService {

    action replicate(erpID : db.Vehicle:erpID);
}
