namespace retail.dwb;

using {CodeList} from '../../db';

entity VehicleAvailabilities : CodeList {
    key code : String(2);
        name : localized String(40);
}

type VehicleAvailability : Association to VehicleAvailabilities;
