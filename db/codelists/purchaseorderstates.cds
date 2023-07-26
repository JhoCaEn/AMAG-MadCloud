namespace retail.dwb;

using {CodeList} from '../../db';

entity PurchaseOrderStates : CodeList {
    key code          : String(4);
        name          : localized String(40);
        orderCreated  : Boolean;
        orderReleased : Boolean;
}

type PurchaseOrderState : Association to one PurchaseOrderStates;
