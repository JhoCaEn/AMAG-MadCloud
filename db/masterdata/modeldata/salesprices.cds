namespace retail.dwb;

using {retail.dwb as db} from '../../../db';
using {replicated} from '../../../db';

entity ModelSalesPrices : replicated {
    key model     : db.Model;
    key validTo   : Date default '9999-12-31';
        validFrom : Date default '1970-01-01';
        value     : Decimal(11, 2);
        currency  : String(5) default 'CHF';
};

type ModelSalesPrice : Association to ModelSalesPrices;
