namespace retail.dwb;

using {CodeList} from '../../db';

entity CallbackSemantics : CodeList {
    key code : String(20);
        name : localized String(50);
}

type CallbackSemantic : Association to CallbackSemantics;
