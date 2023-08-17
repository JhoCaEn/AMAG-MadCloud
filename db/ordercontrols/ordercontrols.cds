namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {replicated} from '../../db';

entity OrderControls : replicated {
    key vehicleUsage       : db.VehicleUsage        @assert.integrity: false;
    key customerState      : db.CustomerState       @assert.integrity: false;
    key endCustomerState   : db.EndCustomerState    @assert.integrity: false;
        soldToSource       : db.PartnerRoleSource   @assert.integrity: false;
        soldToPartner      : db.Partner             @assert.integrity: false;
        shipToSource       : db.PartnerRoleSource   @assert.integrity: false;
        shipToPartner      : db.Partner             @assert.integrity: false;
        billToSource       : db.PartnerRoleSource   @assert.integrity: false;
        billToPartner      : db.Partner             @assert.integrity: false;
        paidBySource       : db.PartnerRoleSource   @assert.integrity: false;
        paidByPartner      : db.Partner             @assert.integrity: false;
        releasedForPartner : Boolean default false;
        forEmployee        : Boolean default false;
        availability       : db.VehicleAvailability @assert.integrity: false;
        orderType          : db.OrderType           @assert.integrity: false;
        deliveryCode       : db.DeliveryCode        @assert.integrity: false;
};

type OrderControl : Association to OrderControls;
