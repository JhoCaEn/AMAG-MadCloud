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
    entity Offers                                    as projection on db.Offers actions {
        action copy(in : $self)                   returns Offers;
        action selectSalesPartner(in : $self, id : Offers:salesPartner.id);
        action selectBrand(in : $self, code : Offers:brand.code);
        action createCarConfiguration(in : $self) returns Offers:carConfigurationID;
        action finishCarConfiguration(in : $self);
        action order(in: $self) returns db.Vehicles:ID;
    };

    action createOffer(salesPartner_id : db.Partners:id, brand_code : db.Brands:code, customerProjectName : String, projectType_code : db.ProjectTypes:code, customerProjectNumber : String, fleetProjectNumber : String, fleetProjectCompanyNumber : String, callback_ID : db.Callbacks:ID) returns db.Offers:ID;

    @readonly
    entity CarConfigurationEquipments                as projection on db.OfferCarConfigurationEquipments;

    @readonly
    entity Models                                    as projection on db.Models;

    @readonly
    entity Colors                                    as projection on db.Colors;

    @readonly
    entity SalesPartners                             as projection on db.SalesPartners {
        id,
        name
    } where validFrom <= current_date
    and     validTo   >= current_date;

    @readonly
    entity SelectableBrands                          as projection on db.OfferSelectableBrands {
        key offer,
        key brand.code,
            brand.name
    }

    @readonly
    entity ModelColorCombinationSalesPrices          as projection on db.ModelColorCombinationSalesPrices;

    @readonly
    entity OfferCarConfigurationEquipmentSalesPrices as projection on db.OfferCarConfigurationEquipmentSalesPrices;

    @readonly
    entity ModelSalesPrices                          as projection on db.CurrentModelSalesPrices;

}
