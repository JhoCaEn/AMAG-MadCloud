namespace retail.dwb;

using {CodeList} from '../../db';

entity EndCustomerStates : CodeList {
    key code : String(2);
        name : localized String(40);
}

type EndCustomerState : Association to EndCustomerStates;
