namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity CarConfigurationSelectableEquipments {
    key configuration : db.CarConfiguration;
    key equipment     : db.Equipment;
        selected      : Boolean default false;
        selectable    : Boolean default true;
        chapter       : db.EquipmentChapter;
        category      : db.EquipmentCategory;
}
