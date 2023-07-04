namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity CarConfigurationSelectableSalesTypes {
    key configuration : db.CarConfiguration;
    key salesType     : db.SalesType;
}
