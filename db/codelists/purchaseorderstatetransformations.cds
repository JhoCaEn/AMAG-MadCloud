namespace retail.dwb;

using {retail.dwb as db, CodeList} from '../../db';

entity PurchaseOrderStateTransformations : CodeList {
    key code : String(4);
        name : String(45);
        state : db.PurchaseOrderState;
}

type PurchaseOrderStateTransformation : Association to one PurchaseOrderStateTransformations;
