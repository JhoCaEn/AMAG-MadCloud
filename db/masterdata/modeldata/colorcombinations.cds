namespace retail.dwb;

using {retail.dwb as db} from '../../../db';
using {replicated} from '../../../db';

entity ModelColorCombinations : replicated {
    key model         : db.Model @assert.integrity: false;
    key exterior      : db.Color @assert.integrity: false;
    key interior      : db.Color @assert.integrity: false;
    key roof          : db.Color @assert.integrity: false;
        validFrom     : Date default '1970-01-01';
        validTo       : Date default '9999-12-31';
        orderableFrom : Date default '1970-01-01';
        orderableTo   : Date default '9999-12-31';
        restrictions  : Composition of many db.ModelColorRestrictions
                            on restrictions.colorCombination = $self;
};

type ModelColorCombination : Association to ModelColorCombinations;