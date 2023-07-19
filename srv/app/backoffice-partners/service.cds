using {retail.dwb as db} from '../../../db';

@path: '/app/backend/backoffice/partners'
service AppBackofficePartnersService {

    @readonly
    entity Partners                     as projection on db.Partners {
        id,
        cast(
            id as Integer
        ) as partnerId,
        name,
        hasBrands,
        hasContracts,
        isSalesPartner,
        validFrom,
        validTo,
        createdAt,
        modifiedAt,
        brands,
        usedInSoldToPartners
    } actions {
        action synchronise(in : $self);
    };

    @readonly
    entity PartnerBrands                as projection on db.PartnerBrands {
        partner,
        brand,
        validFrom,
        validTo,
        isRepresentative,
        hasContracts,
        contracts,
        paidByPartners,
        soldToPartners,
        shipToPartners,
        billToPartners
    };

    @readonly
    entity PartnerBrandSoldToPartners   as projection on db.PartnerBrandSoldToPartners {
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
    entity PartnerBrandShipToPartners   as projection on db.PartnerBrandShipToPartners {
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
    entity PartnerBrandBillToPartners   as projection on db.PartnerBrandBillToPartners {
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
    entity PartnerBrandPaidByPartners   as projection on db.PartnerBrandPaidByPartners {
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
    entity PartnerBrandContracts        as projection on db.PartnerBrandContracts {
        brand,
        type,
        type.code,
        type.name
    };

    extend projection PartnerBrandContracts with {
        modelCategories : Association to many BrandContractTypeModelCategories on modelCategories.type = type
    }

    @readonly
    entity Brands                       as projection on db.Brands {
        code,
        name
    }

    @readonly
    entity BrandContractTypes           as projection on db.BrandContractTypes {
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
    entity ModelCategories              as projection on db.ModelCategories {
        code,
        name
    }
}
