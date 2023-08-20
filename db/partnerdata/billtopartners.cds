namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {replicated} from '../../db';
using {replicatedComposition} from '../../db';

entity PartnerBrandBillToPartners : replicatedComposition {
    key brand     : db.PartnerBrand;
    key partner   : db.Partner;
    key validFrom : Date default '1970-01-01';
        validTo   : Date default '1970-01-01';
        isDefault : Boolean default false;
}

type PartnerBrandBillToPartner        : Association to PartnerBrandBillToPartners;

entity CurrentPartnerBrandBillToPartners as projection on PartnerBrandBillToPartners {
    key partner.id
} where $now between validFrom and validTo;

type CurrentPartnerBrandBillToPartner : Association to CurrentPartnerBrandBillToPartners;
