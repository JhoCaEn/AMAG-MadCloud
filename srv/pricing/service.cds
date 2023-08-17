using {retail.dwb as db} from '../../db';

@protocol: 'none'
service PricingSalesPriceService {
    action calculate(table : String, ID : UUID);
}
