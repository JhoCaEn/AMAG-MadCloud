using {retail.dwb as db} from '../../../../db';

@protocol: 'none'
service ReplicationMasterdataEquipmentCategoryService {

    action replicate(brand : db.Brand:code, id : db.EquipmentCategory:id)
}
