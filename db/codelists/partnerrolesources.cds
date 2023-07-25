namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {CodeList} from '../../db';

entity PartnerRoleSources : CodeList {
    key code : String(15);
        name : localized String(40);
}

type PartnerRoleSource : Association to one PartnerRoleSources;