using {retail.dwb as db} from '../../../../db';

@protocol: 'none'
service ReplicationMasterdataEquipmentChapterService {

    action replicate(brand : db.Brand:code, id : db.EquipmentChapter:id)
}
