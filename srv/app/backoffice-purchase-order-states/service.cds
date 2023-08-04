using {retail.dwb as db} from '../../../db';

@path: '/app/backend/backoffice/purchase-order-states'
service AppBackofficePurchaseOrderStatesService {
    @readonly
    entity PurchaseOrderStates as projection on db.PurchaseOrderStates {
        code,
        name,
        orderCreated,
        orderReleased,
        transformations : redirected to PurchaseOrderStateTransformations,
        texts
    }
    @readonly
    entity PurchaseOrderStateTransformations as projection on db.PurchaseOrderStateTransformations {
        code,
        name,
        state
    }
}
