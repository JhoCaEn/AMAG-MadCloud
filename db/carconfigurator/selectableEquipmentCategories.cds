namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity CarConfigurationSelectableEquipmentCategories {
    key configuration : db.CarConfiguration;
    key category      : db.EquipmentCategory;
        selected      : Boolean default false;
        equipments    : Association to many db.CarConfigurationSelectableEquipments
                            on  equipments.category = category
                            and equipments.configuration = configuration;
        equipment     : db.Equipment;
}
