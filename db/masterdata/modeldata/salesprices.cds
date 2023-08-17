namespace retail.dwb;

using {retail.dwb as db} from '../../../db';
using {replicated} from '../../../db';

entity ModelSalesPrices : replicated {
    key model     : db.Model;
    key validFrom : Date default '1970-01-01';
        validTo   : Date default '9999-12-31';
        value     : Decimal(11, 2);
        currency  : String(5) default 'CHF';
};

type ModelSalesPrice : Association to ModelSalesPrices;

entity CurrentModelSalesPrices as projection on ModelSalesPrices {
    key model,
        value,
        currency
} where $now between validFrom and validTo;
