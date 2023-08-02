using {retail.dwb as db} from '../../db';

service PricingSalesPriceService {
    entity ModelEquipmentSalesPrices        as projection on db.ModelEquipmentSalesPrices;
    entity ModelColorCombinationSalesPrices as projection on db.ModelColorCombinationSalesPrices;
    action calculate(table : String, ID : UUID);
}
