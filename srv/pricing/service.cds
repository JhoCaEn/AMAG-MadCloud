using {retail.dwb as db} from '../../db';

service PricingSalesPriceService {

    action calculate(table : String, ID : UUID);
}