using {retail.dwb as db} from '../../../db';

@path: '/app/backend/orders'
service AppOrdersService {
    @odata.draft.enabled
    entity Orders                           as projection on db.Vehicles;

    @readonly
    entity VehicleEquipments                as projection on db.VehicleEquipments;

    @readonly
    entity ModelColorCombinationSalesPrices as projection on db.ModelColorCombinationSalesPrices;

    @readonly
    entity VehicleEquipmentSalesPrices      as projection on db.VehicleEquipmentSalesPrices;

    @readonly
    entity SalesPartners                    as projection on db.SalesPartners {
        id,
        name
    } where validFrom <= current_date
    and     validTo   >= current_date;

    action createOrder(configuredAt : db.Vehicle:configuredAt, salesPartner_id : db.Vehicle:salesPartner.id, brand_code : db.Vehicle:brand.code, model_id : db.Models:id, exteriorColor_id : db.Colors:id, interiorColor_id : db.Colors:id, roofColor_id : db.Colors:id, equipments : many db.Equipments:id) returns db.Vehicle:ID;
}
