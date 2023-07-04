using {retail.dwb as db} from '../../../../db';

@protocol: 'none'
service ReplicationMasterdataTransmissionService {

    action replicate(id : db.Transmission:id)
}
