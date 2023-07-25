namespace retail.dwb;

using {CodeList} from '../../db';

entity DeliveryCodes : CodeList {
    key code        : String(1);
        name        : localized String(30);
        displayOnly : Boolean;
}

type DeliveryCode : Association to DeliveryCodes;
