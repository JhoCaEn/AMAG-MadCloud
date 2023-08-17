namespace retail.dwb;

using {CodeList} from '../../db';

entity DeliveryCodes : CodeList {
    key code        : String(1);
        name        : localized String(30);
        displayOnly : Boolean default false;
}

type DeliveryCode : Association to DeliveryCodes;
