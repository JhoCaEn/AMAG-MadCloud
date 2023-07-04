using {retail.dwb as db} from '../../../../db';


@protocol: 'none'
service ReplicationMasterdataDriveTypeService {

    action replicate(brand : db.Brand:code, id : db.DriveType:id)
}
