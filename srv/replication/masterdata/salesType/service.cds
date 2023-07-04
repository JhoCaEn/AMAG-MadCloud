using {retail.dwb as db} from '../../../../db';

@protocol: 'none'
service ReplicationMasterdataSalesTypeService {

    action replicate(brand : db.Brand:code, id : db.SalesType:id)
}
