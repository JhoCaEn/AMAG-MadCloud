namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity CarConfigurationSelectableEquipmentChapters {
    key configuration : db.CarConfiguration;
    key chapter       : db.EquipmentChapter;
        equipments    : Association to many db.CarConfigurationSelectableEquipments
                        on  equipments.chapter = chapter
                        and equipments.configuration = configuration;
}
