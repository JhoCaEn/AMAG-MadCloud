namespace retail.dwb;

using {CodeList} from '../../db';

entity ColorTypes : CodeList {
    key code    : String(1);
        name    : localized String(30);
}

type ColorType : Association to ColorTypes;