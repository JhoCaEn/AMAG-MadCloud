namespace retail.dwb;

using {retail.dwb as db} from '../../../db';
using {replicated} from '../../../db';
using {replicatedComposition} from '../../../db';

entity ModelColors : replicatedComposition {
    key model         : db.Model;
    key color         : db.Color @assert.integrity: false;
        validFrom     : Date default '1970-01-01';
        validTo       : Date default '9999-12-31';
        orderableFrom : Date default '1970-01-01';
        orderableTo   : Date default '9999-12-31';
};

type ModelColor : Association to ModelColors;
