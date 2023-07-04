namespace retail.dwb;

using {retail.dwb as db} from '../../../../../db';
using {replicated} from '../../../../../db';

entity ModelColorRestrictionConstraints : replicated {
    key restriction : db.ModelColorRestriction @assert.integrity: false;
    key equipment   : db.Equipment             @assert.integrity: false;
};

type ModelColorRestrictionConstraint : Association to ModelColorRestrictionConstraints;
