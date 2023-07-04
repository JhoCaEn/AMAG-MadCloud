using {retail.dwb as db} from '../../../../db';

@protocol: 'none'
service ReplicationMasterdataEquipmentService {

    action replicate(id : db.Equipment:id)
}
