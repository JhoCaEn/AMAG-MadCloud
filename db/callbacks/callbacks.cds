namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {cuid} from '@sap/cds/common';
using {replicated} from '../../db';

entity Callbacks : cuid, replicated {
    semantic   : db.SemanticObject @assert.integrity: false;
    parameters : String;
}

type Callback : Association to Callbacks;
