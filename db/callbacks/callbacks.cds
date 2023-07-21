namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {
    cuid,
    managed
} from '@sap/cds/common';

entity Callbacks : cuid, managed {
    semantic   : db.CallbackSemantic @assert.integrity: false;
    parameters : String;
}

type Callback : Association to Callbacks;
