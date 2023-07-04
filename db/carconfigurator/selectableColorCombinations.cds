namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity CarConfigurationSelectableColorCombinations {
    key configuration : db.CarConfiguration;
    key exterior      : db.Color;
    key interior      : db.Color;
    key roof          : db.Color;
}
