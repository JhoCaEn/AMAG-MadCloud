namespace retail.dwb;

using {retail.dwb as db} from '../../../../../db';
using {replicated} from '../../../../../db';
using {replicatedComposition} from '../../../../../db';

entity ModelEquipmentRestrictionOptionRules : replicatedComposition {
    key option      : db.ModelEquipmentRestrictionOption @assert.integrity: false;
    key id          : Integer;
        category    : db.EquipmentCategory               @assert.integrity: false;
        color       : db.Color                           @assert.integrity: false;
        equipment   : db.Equipment                       @assert.integrity: false;
        isRequired  : Boolean default false;
        isForbidden : Boolean default false;
};

type ModelEquipmentRestrictionOptionRule : Association to ModelEquipmentRestrictionOptionRules;
