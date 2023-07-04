namespace retail.dwb;

using {retail.dwb as db} from '../../../db';
using {replicated} from '../../../db';

entity BodyTypes : replicated {
    key brand  : db.Brand;
    key id     : String(6);
        name   : localized String(30);

        models : Association to many db.Models
                     on models.bodyType = $self;
};

type BodyType : Association to BodyTypes;
