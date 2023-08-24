using {retail.dwb as db} from '../../../db';

@path: '/app/backend/backoffice/partners'
service AppBackofficePartnersService {

    @readonly
    entity Partners                         as projection on db.Partners {
        id,
        cast(
            id as Integer
        ) as partnerId,
        name,
        hasBrands,
        hasContracts,
        isSalesPartner,
        isAMAGRetail,
        validFrom,
        validTo,
        company,
        department,
        fullName,
        streetName,
        houseNumber,
        postalCode,
        cityName,
        phoneNumber,
        emailAddress,
        createdAt,
        modifiedAt,
        brands,
        usedInSoldToPartners : redirected to PartnerUsedInSoldToPartners,
        usedInShipToPartners : redirected to PartnerUsedInShipToPartners,
        usedInBillToPartners : redirected to PartnerUsedInBillToPartners,
        usedInPaidByPartners : redirected to PartnerUsedInPaidByPartners,
        usedInOrderControlsAsSoldToPartners : redirected to PartnerUsedInOrderControlsAsSoldToPartners,
        usedInOrderControlsAsShipToPartners : redirected to PartnerUsedInOrderControlsAsShipToPartners,
        usedInOrderControlsAsBillToPartners : redirected to PartnerUsedInOrderControlsAsBillToPartners,
        usedInOrderControlsAsPaidByPartners : redirected to PartnerUsedInOrderControlsAsPaidByPartners
    } actions {
        action synchronise(in : $self);
    };

    @readonly
    entity PartnerBrands                    as projection on db.PartnerBrands {
        partner,
        brand,
        validFrom,
        validTo,
        isRepresentative,
        dealerPartner,
        dealerPartner.partner.id as dealerPartnerID,
        hasContracts,
        createdAt,
        contracts,
        soldToPartners : redirected to PartnerBrandSoldToPartners,
        shipToPartners : redirected to PartnerBrandShipToPartners,
        billToPartners : redirected to PartnerBrandBillToPartners,
        paidByPartners : redirected to PartnerBrandPaidByPartners
    };

    @readonly
    entity PartnerBrandSoldToPartners       as projection on db.PartnerBrandSoldToPartners {
        brand,
        partner,
        partner.id,
        partner.name,
        validFrom,
        validTo,
        isDefault,
        createdAt
    };

    @readonly
    entity PartnerBrandShipToPartners       as projection on db.PartnerBrandShipToPartners {
        brand,
        partner,
        partner.id,
        partner.name,
        validFrom,
        validTo,
        isDefault,
        createdAt
    };

    @readonly
    entity PartnerBrandBillToPartners       as projection on db.PartnerBrandBillToPartners {
        brand,
        brand.brand.code,
        partner,
        partner.id,
        partner.name,
        validFrom,
        validTo,
        isDefault,
        createdAt
    };

    @readonly
    entity PartnerBrandPaidByPartners       as projection on db.PartnerBrandPaidByPartners {
        brand,
        brand.brand.code,
        partner,
        partner.id,
        partner.name,
        validFrom,
        validTo,
        isDefault,
        createdAt
    };

    @readonly
    entity PartnerBrandContracts            as projection on db.PartnerBrandContracts {
        brand,
        type,
        type.code,
        type.name
    };

    extend projection PartnerBrandContracts with {
        modelCategories : Association to many BrandContractTypeModelCategories on modelCategories.type = type
    }

    @readonly
    entity PartnerUsedInSoldToPartners      as projection on db.PartnerUsedInSoldToPartners {
        soldToPartner,
        partner,
        brand,
        validFrom,
        validTo,
        partner.name
    }

    @readonly
    entity PartnerUsedInOrderControlsAsSoldToPartners as projection on db.PartnerUsedInOrderControlsAsSoldToPartners {
        soldToPartner,
        vehicleUsage,
        customerState,
        endCustomerState,
        createdAt
    }

    @readonly
    entity PartnerUsedInOrderControlsAsShipToPartners as projection on db.PartnerUsedInOrderControlsAsShipToPartners {
        shipToPartner,
        vehicleUsage,
        customerState,
        endCustomerState,
        createdAt
    }

    @readonly
    entity PartnerUsedInOrderControlsAsBillToPartners as projection on db.PartnerUsedInOrderControlsAsBillToPartners {
        billToPartner,
        vehicleUsage,
        customerState,
        endCustomerState,
        createdAt
    }

    @readonly
    entity PartnerUsedInOrderControlsAsPaidByPartners as projection on db.PartnerUsedInOrderControlsAsPaidByPartners {
        paidByPartner,
        vehicleUsage,
        customerState,
        endCustomerState,
        createdAt
    }
    
    @readonly
    entity PartnerUsedInShipToPartners      as projection on db.PartnerUsedInShipToPartners {
        shipToPartner,
        partner,
        brand,
        validFrom,
        validTo,
        partner.name
    }

    @readonly
    entity PartnerUsedInBillToPartners      as projection on db.PartnerUsedInBillToPartners {
        billToPartner,
        partner,
        brand,
        validFrom,
        validTo,
        partner.name
    }

    @readonly
    entity PartnerUsedInPaidByPartners      as projection on db.PartnerUsedInPaidByPartners {
        paidByPartner,
        partner,
        brand,
        validFrom,
        validTo,
        partner.name
    }

    @readonly
    entity Brands                           as projection on db.Brands {
        code,
        name
    }

    @readonly
    entity BrandContractTypes               as projection on db.BrandContractTypes {
        brand,
        code,
        name
    }

    @readonly
    entity BrandContractTypeModelCategories as projection on db.BrandContractTypeModelCategories {
        brandContractType as type,
        modelCategory @cds.api.ignore,
        modelCategory.code,
        modelCategory.name
    }

    @readonly
    entity ModelCategories                  as projection on db.ModelCategories {
        code,
        name
    }
}
