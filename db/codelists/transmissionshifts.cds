namespace retail.dwb;

using {CodeList} from '../../db';

entity TransmissionShifts : CodeList {
    key code        : String(10);
        name        : localized String(35);
}

type TransmissionShift : Association to one TransmissionShifts;