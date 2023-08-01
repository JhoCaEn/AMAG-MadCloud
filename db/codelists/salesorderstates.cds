namespace retail.dwb;

using {CodeList} from '../../db';

entity SalesOrderStates : CodeList {
    key code : String(4);
        name : localized String(40);
}

type SalesOrderState : Association to one SalesOrderStates;