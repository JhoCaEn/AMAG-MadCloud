namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity PartnerUsedInOrderControlsAsShipToPartners as projection on db.OrderControls {
    key vehicleUsage,
    key customerState,
    key endCustomerState,
        shipToPartner,
        createdAt
}