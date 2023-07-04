namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {replicated} from '../../db';

entity Equipments : replicated {
    key id           : String(8);
        code         : String(7);
        technicalKey : String(30);
        name         : localized String(200);
        displayName  : localized String(200);
        chapter      : db.EquipmentChapter  @assert.integrity: false;
        category     : db.EquipmentCategory @assert.integrity: false;
        brand        : db.Brand             @assert.integrity: false;

        models       : Association to many db.ModelEquipments
                           on models.equipment = $self
};

type Equipment : Association to Equipments;
