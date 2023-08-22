namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity CarConfigurationSelectableModelRestrictionsRules {
    key configuration        : db.CarConfiguration;
    key modelRestrictionRule : db.ModelRestrictionRule;
        selected             : Boolean default false;
}
