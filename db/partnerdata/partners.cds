namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {replicated} from '../../db';

entity Partners : replicated {
    key id                   : String(10);
        name                 : String(40);
        hasBrands            : Boolean default false;
        hasContracts         : Boolean default false;
        isSalesPartner       : Boolean default false;
        validFrom            : Date default '1970-01-01';
        validTo              : Date default '1970-01-01';

        brands               : Composition of many db.PartnerBrands
                                   on brands.partner = $self;
        usedInSoldToPartners : Composition of many db.PartnerBrandSoldToPartners
                                   on usedInSoldToPartners.partner = $self;
        usedInShipToPartners : Composition of many db.PartnerBrandShipToPartners
                                   on usedInShipToPartners.partner = $self;
        usedInBillToPartners : Composition of many db.PartnerBrandBillToPartners
                                   on usedInBillToPartners.partner = $self;
        usedInPaidByPartners : Composition of many db.PartnerBrandPaidByPartners
                                   on usedInPaidByPartners.partner = $self;
}

type Partner : Association to Partners;
