using {retail.dwb as db} from '../../../../db';

@protocol: 'none'
service ReplicationMasterdataBrandCharacteristicService {

    action replicate(brand : db.Brand:code, type: db.Characteristic:code)
}
