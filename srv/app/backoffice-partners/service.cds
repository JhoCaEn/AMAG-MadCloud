using {retail.dwb as db} from '../../../db';

@path: '/app/backend/backoffice/partners'
service AppBackofficePartnersService {

    @readonly
    entity Partners              as projection on db.Partners {
        id,
        name,
        hasBrands,
        hasContracts,
        validFrom,
        validTo,
        createdAt,
        modifiedAt,
        brands
    } actions {
        action synchronise(in : $self);
    };

    @readonly
    entity PartnerBrands         as projection on db.PartnerBrands {
        partner,
        brand,
        hasContracts,
        validFrom,
        validTo,
        contracts
    };

    @readonly
    entity PartnerBrandContracts as projection on db.PartnerBrandContracts {
        brand,
        type
    };

    @readonly
    entity Brands                as projection on db.Brands {
        code,
        name
    }

    @readonly
    entity BrandContractTypes as projection on db.BrandContractTypes {
        brand,
        code,
        name
    }
}
