namespace retail.dwb;

using {retail.dwb as db} from '../../../db';
using {replicated} from '../../../db';

entity DriveTypes : replicated {
    key brand         : db.Brand;
    key id            : String(8);
        train         : db.DriveTrain @assert.integrity: false;
        name          : localized String(30);

        transmissions : Association to many db.Transmissions
                            on transmissions.driveType = $self;
};

type DriveType : Association to DriveTypes;
