namespace retail.dwb;

using {retail.dwb as db} from '../../../../../db';
using {replicated} from '../../../../../db';

entity ModelRestrictions : replicated {
    key model : db.Model @assert.integrity: false;
    key id    : Integer;
        rules : Composition of many db.ModelRestrictionRules
                    on rules.restriction = $self;
};

type ModelRestriction : Association to ModelRestrictions;
