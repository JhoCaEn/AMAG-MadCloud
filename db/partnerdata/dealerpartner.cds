namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity DealerPartners as projection on db.PartnerBrandBillToPartners {
    key partner
}

type DealerPartner : Association to DealerPartners;