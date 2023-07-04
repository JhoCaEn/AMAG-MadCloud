namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity CarConfigurationSelectableModelRestrictions {
    key configuration    : db.CarConfiguration;
    key modelRestriction : db.ModelRestriction;
}
