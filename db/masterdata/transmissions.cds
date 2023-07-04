namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {replicated} from '../../db';

entity Transmissions : replicated {
    key id        : String(8);
        gears     : Integer;
        name      : localized String(70);
        driveType : db.DriveType        @assert.integrity: false;
        type      : db.TransmissionType @assert.integrity: false;
        brand     : db.Brand            @assert.integrity: false;

        models    : Association to many db.Models
                        on models.transmission = $self;
}

type Transmission : Association to Transmissions;
