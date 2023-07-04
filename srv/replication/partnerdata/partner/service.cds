using {retail.dwb as db} from '../../../../db';

@protocol: 'none'
service ReplicationPartnerdataPartnerService {

    action replicate(id : db.Partner:id)
}
