namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity CarConfigurationSelectableColorTypes {
    key configuration : db.CarConfiguration;
    key type          : db.ColorType;
        selected      : Boolean default false;
        color         : db.Color @assert.integrity: false;
        colors        : Association to many db.CarConfigurationSelectableColors
                            on  colors.configuration = configuration
                            and colors.type          = type;
}
