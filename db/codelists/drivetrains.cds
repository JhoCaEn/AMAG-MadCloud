namespace retail.dwb;

using {CodeList} from '../../db';

entity DriveTrains : CodeList {
    key code    : String(10);
        name    : localized String(35);
}

type DriveTrain : Association to DriveTrains;