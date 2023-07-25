using {retail.dwb as db} from '../../../db';

@path: '/app/backend/callbacks'
service AppCallbacksService {

    action createCallback(semantic : String, parameters : String) returns db.Callbacks:ID;
    
    @odata.draft.enabled
    entity Callbacks as projection on db.Callbacks;

    @readonly
    entity CallbackSemantics as projection on db.CallbackSemantics {
        code,
        name
    }
}
