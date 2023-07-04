namespace retail.dwb;

using {retail.dwb as db} from '../../../db';
using {replicated} from '../../../db';

entity FuelTypes : replicated {
    key brand   : db.Brand;
    key id      : String(6);
        unit    : String(8);
        name    : localized String(30);

        engines : Association to many db.Engines
                      on engines.fuelType = $self;
};

type FuelType : Association to FuelTypes;
