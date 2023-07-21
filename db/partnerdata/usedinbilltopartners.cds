namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity PartnerUsedInBillToPartners as projection on db.PartnerBrandBillToPartners {
    key partner     as billToPartner,
    key brand.partner,
    key brand.brand as brand,
    key validFrom,
        validTo
}
