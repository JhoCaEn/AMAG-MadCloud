namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity PartnerUsedInOrderControlsAsSoldToPartners as projection on db.OrderControls {
    key vehicleUsage,
    key customerState,
    key endCustomerState,
        soldToPartner,
        createdAt
}
