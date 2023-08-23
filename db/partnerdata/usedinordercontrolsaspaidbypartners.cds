namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity PartnerUsedInOrderControlsAsPaidByPartners as projection on db.OrderControls {
    key vehicleUsage,
    key customerState,
    key endCustomerState,
        paidByPartner,
        createdAt
}