namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {replicated} from '../../db';
using {replicatedComposition} from '../../db';

entity PartnerBrandContracts : replicatedComposition {
    key brand : db.PartnerBrand;
    key type: db.BrandContractType;
}

type PartnerBrandContract : Association to PartnerBrandContracts;
