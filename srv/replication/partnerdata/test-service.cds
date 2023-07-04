using {retail.dwb as db} from '../../../db';

@requires: 'authenticated-user'
service ReplicationPartnerdataTestService {

    function testPartner(id : db.Partner:id)      returns String;
    function testStaticPartner()                  returns String;
}
