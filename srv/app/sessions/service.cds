using {retail.dwb as db} from '../../../db';

@path: '/app/backend/sessions'
service AppSessionsService {
    @odata.draft.enabled
    entity Sessions      as projection on db.Sessions actions {
        action prepare(in : $self);
    };

    @readonly
    entity Brands        as projection on db.Brands {
        code, 
        name
    };

    @readonly
    entity ProjectTypes  as projection on db.ProjectTypes {
        code,
        name
    };

    @readonly
    entity SalesPartners as projection on db.SalesPartners {
        id, 
        name
    };


    @readonly
    entity Offers as projection on db.Offers {
        ID
    };


    action createSession(salesPartner_id : SalesPartners:id, brand_code : Brands:code, projectType : ProjectTypes:code, customerProjectName : String, customerProjectNumber : String, fleetProjectNumber : String, fleetProjectCompanyNumber : String, ocd : Integer) returns db.Sessions:ID;
}
