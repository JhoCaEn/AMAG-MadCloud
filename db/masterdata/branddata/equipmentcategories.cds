namespace retail.dwb;

using {retail.dwb as db} from '../../../db';
using {replicated} from '../../../db';

entity EquipmentCategories : replicated {
    key brand      : db.Brand;
    key id         : String(7);
        name       : localized String(30);

        equipments : Association to many db.Equipments
                         on equipments.category = $self;
}

type EquipmentCategory : Association to EquipmentCategories;
