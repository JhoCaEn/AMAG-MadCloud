namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity CarConfigurationSelectableModels {
    key configuration : db.CarConfiguration;
    key model         : db.Model;
        selected      : Boolean default false;
}
