using {retail.dwb as db} from '../../../db';

@requires: ['authenticated-user']
@path    : '/app/backend/offers'
service AppOffersService {
    @Capabilities: {
        InsertRestrictions.Insertable: true,
        UpdateRestrictions.Updatable : true,
        DeleteRestrictions.Deletable : false
    }
    @odata.draft.enabled
    entity Offers           as projection on db.Offers actions {
        action copy(in : $self)                   returns Offers;
        action selectSalesPartner(in : $self, id : Offers:salesPartner.id);
        action selectBrand(in : $self, code : Offers:brand.code);
        action createCarConfiguration(in : $self) returns Offers:carConfigurationID;
        action finishCarConfiguration(in : $self);
    };

    @readonly
    entity CarConfigurationEquipments  as projection on db.OfferCarConfigurationEquipments;

    @readonly
    entity Models           as projection on db.Models;

    @readonly
    entity Colors           as projection on db.Colors;

    @readonly
    entity SalesPartners  as projection on db.SalesPartners {
        id,
        name
    } where validFrom <= current_date and validTo >= current_date;

    @readonly
    entity SelectableBrands as projection on db.OfferSelectableBrands {
        key offer,
        key brand.code,
            brand.name
    }
}
