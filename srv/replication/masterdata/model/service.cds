using {retail.dwb as db} from '../../../../db';

@protocol: 'none'
service ReplicationMasterdataModelService {

    action replicate(id : db.Model:id)
}
