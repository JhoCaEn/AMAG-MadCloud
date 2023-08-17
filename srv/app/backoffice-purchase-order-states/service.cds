using {retail.dwb as db} from '../../../db';
using {sap.common.Languages as Languages} from '@sap/cds/common';

@path: '/app/backend/backoffice/purchase-order-states'
service AppBackofficePurchaseOrderStatesService {
    @readonly
    entity States          as projection on db.PurchaseOrderStates {
        code,
        name,
        orderCreated,
        orderReleased,
        transformations,
        texts
    }

    @readonly
    entity States.texts    as projection on db.PurchaseOrderStates.texts

    extend projection States.texts with {
        language : Association to one Languages on language.code = locale
    }

    @readonly
    entity Transformations as projection on db.PurchaseOrderStateTransformations {
        code,
        name,
        state
    }
}
