using {retail.dwb as db} from '../../../../db';

@protocol: 'none'
service ReplicationMasterdataOrderControlsService {

    action replicate(vehicleUsage : db.VehicleUsages:code, customerState : db.CustomerStates:code, endCustomerState : db.EndCustomerStates:code);

    @topic: 'partner/replicate'
    event ![partner/replicate] {
        id: db.Partner:id
    }
}
