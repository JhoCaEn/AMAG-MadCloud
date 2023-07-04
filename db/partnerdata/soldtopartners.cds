namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {replicated} from '../../db';

entity PartnerBrandSoldToPartners : replicated {
    key brand     : db.PartnerBrand;
    key partner   : db.Partner;
    key validFrom : Date default '1970-01-01';
        validTo   : Date default '1970-01-01';
        isDefault : Boolean default false;
}

type PartnerBrandSoldToPartner : Association to PartnerBrandSoldToPartners;
