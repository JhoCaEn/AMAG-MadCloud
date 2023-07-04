namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {replicated} from '../../db';

entity PartnerBrandContracts : replicated {
    key brand : db.PartnerBrand;
    key type: db.BrandContractType;
}

type PartnerBrandContract : Association to PartnerBrandContracts;
