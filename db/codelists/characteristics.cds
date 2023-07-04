namespace retail.dwb;

using {CodeList} from '../../db';

entity Characteristics : CodeList {
    key code    : String(20);
        name    : localized String(35);
}

type Characteristic : Association to Characteristics;