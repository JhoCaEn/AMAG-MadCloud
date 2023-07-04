using {retail.dwb as db} from '../../../db';

@path: '/app/backend/sessions'
@requires: ['authenticated-user']
service AppSessionsService {
    @readonly
    entity Sessions as projection on db.Sessions;
}