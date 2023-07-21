namespace retail.dwb;

using {CodeList} from '../../db';

entity CustomerStates : CodeList {
    key code : String(2);
        name : localized String(40);
}

type CustomerState : Association to CustomerStates;
