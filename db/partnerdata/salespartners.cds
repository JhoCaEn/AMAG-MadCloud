namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity SalesPartners as projection on db.Partners {
    key id,
        name,
        validFrom,
        validTo
} where(
        hasBrands    = true
    and hasContracts = true
)

type SalesPartner : Association to SalesPartners;
