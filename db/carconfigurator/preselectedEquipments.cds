namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity CarConfigurationPreselectedEquipments {
    key configuration : db.CarConfiguration;
    key equipment     : db.Equipment;
}