namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity PartnerUsedInShipToPartners as projection on db.PartnerBrandShipToPartners {
    key partner     as shipToPartner,
    key brand.partner,
    key brand.brand as brand,
    key validFrom,
        validTo,
        createdAt
}
