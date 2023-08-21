namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {replicated} from '../../db';
using {replicatedComposition} from '../../db';

entity PartnerBrands : replicatedComposition {
    key partner          : db.Partner;
    key brand            : db.Brand;
    key validFrom        : Date default '1970-01-01';
        validTo          : Date default '1970-01-01';
        hasContracts     : Boolean default false;
        isRepresentative : Boolean default false;
        dealerPartner    : db.CurrentPartnerBrandBillToPartner;

        contracts        : Composition of many db.PartnerBrandContracts
                               on contracts.brand = $self;
        soldToPartners   : Composition of many db.PartnerBrandSoldToPartners
                               on soldToPartners.brand = $self;
        shipToPartners   : Composition of many db.PartnerBrandShipToPartners
                               on shipToPartners.brand = $self;
        billToPartners   : Composition of many db.PartnerBrandBillToPartners
                               on billToPartners.brand = $self;
        paidByPartners   : Composition of many db.PartnerBrandPaidByPartners
                               on paidByPartners.brand = $self;
};

type PartnerBrand : Association to PartnerBrands;
