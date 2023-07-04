using {retail.dwb as db} from '../../../../db';

@protocol: 'none'
service ReplicationMasterdataColorService {

    action replicate(id : db.Color:id)
}
