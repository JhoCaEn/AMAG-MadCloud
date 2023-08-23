namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {replicated} from '../../db';

entity Partners : replicated {
    key id                                  : String(10);
        name                                : String(40);
        hasBrands                           : Boolean default false;
        hasContracts                        : Boolean default false;
        isSalesPartner                      : Boolean default false;
        isAMAGRetail                        : Boolean default false;
        validFrom                           : Date default '1970-01-01';
        validTo                             : Date default '1970-01-01';
        fullName                            : String(80);
        streetName                          : String(60);
        houseNumber                         : String(10);
        postalCode                          : String(10);
        cityName                            : String(40);
        phoneNumber                         : String(30);
        emailAddress                        : String(241);

        brands                              : Composition of many db.PartnerBrands
                                                  on brands.partner = $self;
        usedInSoldToPartners                : Composition of many db.PartnerUsedInSoldToPartners
                                                  on usedInSoldToPartners.soldToPartner = $self;
        usedInShipToPartners                : Composition of many db.PartnerUsedInShipToPartners
                                                  on usedInShipToPartners.shipToPartner = $self;
        usedInBillToPartners                : Composition of many db.PartnerUsedInBillToPartners
                                                  on usedInBillToPartners.billToPartner = $self;
        usedInPaidByPartners                : Composition of many db.PartnerUsedInPaidByPartners
                                                  on usedInPaidByPartners.paidByPartner = $self;
        usedInOrderControlsAsSoldToPartners : Composition of many db.PartnerUsedInOrderControlsAsSoldToPartners
                                                  on usedInOrderControlsAsSoldToPartners.soldToPartner = $self;
        usedInOrderControlsAsShipToPartners : Composition of many db.PartnerUsedInOrderControlsAsShipToPartners
                                                  on usedInOrderControlsAsShipToPartners.shipToPartner = $self;
        usedInOrderControlsAsPaidByPartners : Composition of many db.PartnerUsedInOrderControlsAsPaidByPartners
                                                  on usedInOrderControlsAsPaidByPartners.paidByPartner = $self;
}

type Partner : Association to Partners;
