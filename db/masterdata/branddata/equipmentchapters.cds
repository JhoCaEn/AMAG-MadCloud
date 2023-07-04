namespace retail.dwb;

using {retail.dwb as db} from '../../../db';
using {replicated} from '../../../db';

entity EquipmentChapters : replicated {
    key brand                    : db.Brand;
    key id                       : String(3);
        characteristicName       : String(30);
        name                     : localized String(30);
        isVisible                : Boolean default false;
        isVisibleInConfigurator  : Boolean default false;
        isVisibleInSellingSystem : Boolean default false;

        equipments               : Association to many db.Equipments
                                       on equipments.chapter = $self;
}

type EquipmentChapter : Association to EquipmentChapters;
