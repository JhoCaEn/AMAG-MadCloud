using {retail.dwb as db} from '../../../db';

@path: '/app/backend/backoffice/partners'
service AppBackofficePartnersService {

    @readonly
    entity Partners              as projection on db.Partners {
        id,
        name,
        hasBrands,
        hasContracts,
        isSalesPartner,
        validFrom,
        validTo,
        createdAt,
        modifiedAt,
        brands,
        brandSolds
    } actions {
        action synchronise(in : $self);
    };

    @readonly
    entity PartnerBrands         as projection on db.PartnerBrands {
        partner,
        brand,
        validFrom,
        validTo,
        isRepresentative,
        hasContracts,
        contracts
    };

    @readonly
    entity PartnerBrandSoldToPartners as projection on db.PartnerBrandSoldToPartners {
        brand,
        partner,
        validFrom,
        validTo,
        isDefault
    };

    @readonly
    entity PartnerBrandContracts as projection on db.PartnerBrandContracts {
        brand,
        type,
        type.code,
        type.name
    };

    @readonly
    entity Brands                as projection on db.Brands {
        code,
        name
    }

    @readonly
    entity BrandContractTypes    as projection on db.BrandContractTypes {
        brand,
        code,
        name
    }
}
