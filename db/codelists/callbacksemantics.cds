namespace retail.dwb;

using {CodeList} from '../../db';

entity CallbackSemantics : CodeList {
    key code : String;
        name : String;
}

type CallbackSemantic : Association to CallbackSemantics;
