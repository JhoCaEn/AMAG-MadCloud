using {retail.dwb as db} from '../../../db';

service InterfacesVehicleActionsService {
    action createOrder(ID : UUID);
    action changeOrder(ID : UUID);
    action releaseOrder(ID : UUID);
    action cancelOrder(ID : UUID);
}
