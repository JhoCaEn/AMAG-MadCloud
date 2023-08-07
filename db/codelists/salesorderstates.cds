namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {CodeList} from '../../db';

entity SalesOrderStates : CodeList {
    key code            : String(4);
        name            : localized String(45);
        transformations : Association to many db.SalesOrderStateTransformations
                              on transformations.state = $self;
}

type SalesOrderState : Association to one SalesOrderStates;
