namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {replicated} from '../../db';

entity Engines : replicated {
    key id        : String(8);
        capacity  : Integer;
        powerHP   : Integer;
        powerKW   : Integer;
        cylinders : Integer;
        name      : localized String(70);
        fuelType  : db.FuelType @assert.integrity: false;
        brand     : db.Brand    @assert.integrity: false;

        models    : Association to many db.Models
                        on models.engine = $self;
}

type Engine : Association to Engines;
