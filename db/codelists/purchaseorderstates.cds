namespace retail.dwb;

using {CodeList} from '../../db';
using {retail.dwb as db} from '../../db';

entity PurchaseOrderStates : CodeList {
    key code            : String(4);
        name            : localized String(40);
        orderCreated    : Boolean;
        orderReleased   : Boolean;
        transformations : Composition of many db.PurchaseOrderStateTransformations
                              on transformations.state.code = $self.code;
}

type PurchaseOrderState : Association to one PurchaseOrderStates;
