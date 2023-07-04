using {retail.dwb as db} from '../../../../db';


@protocol: 'none'
service ReplicationMasterdataBodyTypeService {
    
    action replicate(brand : db.Brand:code, id : db.BodyType:id)
}
