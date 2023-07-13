using {retail.dwb as db} from '../../../../db';

@protocol: 'none'
service ReplicationPartnerdataPartnerService {

    action replicate(id : db.Partner:id);

    @topic: 'partner/replicate'
    event ![partner/replicate] {
        id: db.Partner:id
    }
}
