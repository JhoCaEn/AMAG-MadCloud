namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {replicated} from '../../db';
using {replicatedComposition} from '../../db';

entity PartnerBrandShipToPartners : replicatedComposition {
    key brand     : db.PartnerBrand;
    key partner   : db.Partner;
    key validFrom : Date default '1970-01-01';
        validTo   : Date default '1970-01-01';
        isDefault : Boolean default false;
}

type PartnerBrandShipToPartner : Association to PartnerBrandShipToPartners;
