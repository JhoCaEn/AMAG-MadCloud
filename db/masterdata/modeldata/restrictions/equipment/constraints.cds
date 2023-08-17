namespace retail.dwb;

using {retail.dwb as db} from '../../../../../db';
using {replicated} from '../../../../../db';
using {replicatedComposition} from '../../../../../db';

entity ModelEquipmentRestrictionConstraints : replicatedComposition {
    key restriction : db.ModelEquipmentRestriction @assert.integrity: false;
    key equipment   : db.Equipment                 @assert.integrity: false;
};

type ModelEquipmentRestrictionConstraint : Association to ModelEquipmentRestrictionConstraints;
