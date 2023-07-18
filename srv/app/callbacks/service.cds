using {retail.dwb as db} from '../../../db';

@path: '/app/backend/callbacks'
service AppCallbacksService {
    @odata.draft.enabled
    entity Callbacks as projection on db.Callbacks;
}
