namespace retail.dwb;

using {retail.dwb as db} from '../../../../../db';
using {replicated} from '../../../../../db';
using {replicatedComposition} from '../../../../../db';

entity ModelEquipmentRestrictionOptions : replicatedComposition {
    key restriction : db.ModelEquipmentRestriction @assert.integrity: false;
    key id          : Integer;
        rules       : Composition of many db.ModelEquipmentRestrictionOptionRules
                          on rules.option = $self;
};

type ModelEquipmentRestrictionOption : Association to ModelEquipmentRestrictionOptions;
