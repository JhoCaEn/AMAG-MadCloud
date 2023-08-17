namespace retail.dwb;

using {retail.dwb as db} from '../../../../../db';
using {replicated} from '../../../../../db';
using {replicatedComposition} from '../../../../../db';

entity ModelColorRestrictionOptions : replicatedComposition {
    key restriction : db.ModelColorRestriction @assert.integrity: false;
    key id          : Integer;
        rules       : Composition of many db.ModelColorRestrictionOptionRules
                          on rules.option = $self;
};

type ModelColorRestrictionOption : Association to ModelColorRestrictionOptions;
