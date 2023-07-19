namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {CodeList} from '../../db';

entity ProjectTypes : CodeList {
    key code : String(1);
        name : localized String(40);
}

type ProjectType : Association to one ProjectTypes;
