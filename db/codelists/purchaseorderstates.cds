namespace retail.dwb;

using {CodeList} from '../../db';
using {retail.dwb as db} from '../../db';

entity PurchaseOrderStates : CodeList {
    key code            : String(4);
        name            : localized String(40);
        orderCreated    : Boolean default false;
        orderReleased   : Boolean default false;
        transformations : Association to many db.PurchaseOrderStateTransformations
                              on transformations.state = $self;
}

type PurchaseOrderState : Association to one PurchaseOrderStates;
