namespace retail.dwb;

using {CodeList} from '../../db';

entity VehicleUsages : CodeList {
    key code : String(2);
        name : localized String(40);
}

type VehicleUsage : Association to VehicleUsages;
