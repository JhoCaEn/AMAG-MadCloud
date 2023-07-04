namespace retail.dwb;

using {retail.dwb as db} from '../../../db';
using {replicated} from '../../../db';

entity TransmissionTypes : replicated {
    key brand         : db.Brand;
    key id            : String(6);
        shift         : db.TransmissionShift @assert.integrity: false;
        name          : localized String(30);

        transmissions : Association to many db.Transmissions
                            on transmissions.type = $self;
};

type TransmissionType : Association to TransmissionTypes;
