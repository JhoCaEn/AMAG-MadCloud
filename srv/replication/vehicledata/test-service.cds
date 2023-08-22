using {retail.dwb as db} from '../../../db';

@requires: 'authenticated-user'
service ReplicationVehicledataVehicleTestService {

    function testVehicle(id : db.Vehicles:erpID) returns String;
    function testStaticVehicles()                returns String;
}
