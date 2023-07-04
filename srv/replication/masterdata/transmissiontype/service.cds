using {retail.dwb as db} from '../../../../db';

@protocol: 'none'
service ReplicationMasterdataTransmissionTypeService {

    action replicate(brand : db.Brand:code, id : db.TransmissionType:id)
}
