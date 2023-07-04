namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity CarConfigurationModelColorsPrepared          as projection on db.ModelColors {
    *,
    color.type
}

entity CarConfigurationModelEquipmentsPrepared      as projection on db.ModelEquipments {
    *,
    equipment.chapter.isVisibleInConfigurator,
    equipment.chapter,
    equipment.category
}

entity CarConfigurationSelectableEquipmentsPrepared as projection on db.CarConfigurationSelectableEquipments {
    *,
    equipment.chapter,
    equipment.category
}
