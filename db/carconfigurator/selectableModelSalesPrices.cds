namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity CarConfigurationSelectableModelSalesPrices {
    key configuration : db.CarConfiguration;
    key salesPrice    : db.ModelSalesPrice;
}
