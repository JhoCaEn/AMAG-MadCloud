namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {CodeList} from '../../db';

entity ModelCategories : CodeList {
    key code   : String(1);
        name   : localized String(30);

        models : Association to many db.Models
                     on models.category = $self;
}

type ModelCategory : Association to one ModelCategories;
