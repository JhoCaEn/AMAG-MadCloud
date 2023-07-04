namespace retail.dwb;

using {retail.dwb as db} from '../../../../../db';
using {replicated} from '../../../../../db';

entity ModelEquipmentRestrictionOptions : replicated {
    key restriction : db.ModelEquipmentRestriction @assert.integrity: false;
    key id          : Integer;
        rules       : Composition of many db.ModelEquipmentRestrictionOptionRules
                          on rules.option = $self;
};

type ModelEquipmentRestrictionOption : Association to ModelEquipmentRestrictionOptions;
