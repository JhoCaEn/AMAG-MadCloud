namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity PartnerUsedInSoldToPartners as projection on db.PartnerBrandSoldToPartners {
    key partner       as soldToPartner,
    key brand.partner,
    key brand.brand   as brand,
    key validFrom,
        validTo,
        createdAt
}
