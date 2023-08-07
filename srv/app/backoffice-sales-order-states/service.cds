using {retail.dwb as db} from '../../../db';
using {sap.common.Languages as Languages} from '@sap/cds/common';

@path: '/app/backend/backoffice/sales-order-states'
service AppBackofficeSalesOrderStatesService {

    @readonly
    entity States          as projection on db.SalesOrderStates {
        code,
        name,
        texts,
        transformations
    };

    @readonly
    entity States.texts    as projection on db.SalesOrderStates.texts

    extend projection States.texts with {
        language : Association to one Languages on language.code = locale
    }

    @readonly
    entity Transformations as projection on db.SalesOrderStateTransformations {
        code,
        name,
        state
    }
}
