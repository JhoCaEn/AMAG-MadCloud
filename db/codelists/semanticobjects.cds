namespace retail.dwb;

using {CodeList} from '../../db';

entity SemanticObjects : CodeList {
    key code : String;
        name : String;
}

type SemanticObject : Association to SemanticObjects;
