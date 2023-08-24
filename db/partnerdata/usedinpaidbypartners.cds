namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity PartnerUsedInPaidByPartners as projection on db.PartnerBrandPaidByPartners {
    key partner     as paidByPartner,
    key brand.partner,
    key brand.brand as brand,
    key validFrom,
        validTo,
        createdAt
}
