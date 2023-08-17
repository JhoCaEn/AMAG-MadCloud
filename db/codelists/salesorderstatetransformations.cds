namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {CodeList} from '../../db';

entity SalesOrderStateTransformations : CodeList {
    key code : String(4);
        name : String(50);
        state: db.SalesOrderState;
}

type SalesOrderStateTransformation : Association to one SalesOrderStateTransformations;
