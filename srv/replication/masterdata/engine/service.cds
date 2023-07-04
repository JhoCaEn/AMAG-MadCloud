using {retail.dwb as db} from '../../../../db';

@protocol: 'none'
service ReplicationMasterdataEngineService {
    action replicate(id : db.Engine:id);
}
