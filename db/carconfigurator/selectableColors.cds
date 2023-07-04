namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity CarConfigurationSelectableColors {
    key configuration : db.CarConfiguration;
    key color         : db.Color;
        type          : db.ColorType;
        selected      : Boolean default false;
        selectable    : Boolean default true;
}
