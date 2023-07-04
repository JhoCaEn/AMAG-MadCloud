namespace retail.dwb;

using {retail.dwb as db} from '../../../../../db';
using {replicated} from '../../../../../db';

entity ModelColorRestrictionOptionRules : replicated {
    key option      : db.ModelColorRestrictionOption @assert.integrity: false;
    key id          : Integer;
        category    : db.EquipmentCategory           @assert.integrity: false;
        color       : db.Color                       @assert.integrity: false;
        equipment   : db.Equipment                   @assert.integrity: false;
        isRequired  : Boolean default false;
        isForbidden : Boolean default false;
};

type ModelColorRestrictionOptionRule : Association to ModelColorRestrictionOptionRules;
