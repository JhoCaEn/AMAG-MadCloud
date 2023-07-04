namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity CarConfigurationEquipments {
    key configuration : db.CarConfiguration;
    key equipment     : db.Equipment;
}
