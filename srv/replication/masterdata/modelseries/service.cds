using {retail.dwb as db} from '../../../../db';

@protocol: 'none'
service ReplicationMasterdataModelSeriesService {

    action replicate(brand : db.Brand:code, id : db.ModelSeries:id)
}
