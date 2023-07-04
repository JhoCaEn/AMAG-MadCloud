namespace retail.dwb;

using {retail.dwb as db} from '../../../../../db';
using {replicated} from '../../../../../db';

entity ModelEquipmentRestrictions : replicated {
    key equipment   : db.ModelEquipment @assert.integrity: false;
    key constraint  : String;
        constraints : Composition of many db.ModelEquipmentRestrictionConstraints
                          on constraints.restriction = $self;
        options     : Composition of many db.ModelEquipmentRestrictionOptions
                          on options.restriction = $self;
};

type ModelEquipmentRestriction : Association to ModelEquipmentRestrictions;
