namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity CarConfigurationSelectableModelCategories {
    key configuration : db.CarConfiguration;
    key category      : db.ModelCategory;
}