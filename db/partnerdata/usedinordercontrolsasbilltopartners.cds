namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity PartnerUsedInOrderControlsAsBillToPartners as projection on db.OrderControls {
    key vehicleUsage,
    key customerState,
    key endCustomerState,
        billToPartner,
        createdAt
}