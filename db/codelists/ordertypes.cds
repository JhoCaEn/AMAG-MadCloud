namespace retail.dwb;

using {CodeList} from '../../db';

entity OrderTypes : CodeList {
    key code : String(2);
        name : localized String(40);
}
