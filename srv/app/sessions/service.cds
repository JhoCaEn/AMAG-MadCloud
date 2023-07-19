using {retail.dwb as db} from '../../../db';

@path: '/app/backend/sessions'
service AppSessionsService {
    @odata.draft.enabled
    entity Sessions      as projection on db.Sessions;

    @readonly
    entity Brands        as projection on db.Brands;

    @readonly
    entity ProjectTypes  as projection on db.ProjectTypes;

    @readonly
    entity SalesPartners as projection on db.SalesPartners;


    action createSession(salesPartner_id : SalesPartners:id, brand_code : Brands:code, projectType : ProjectTypes:code, customerProjectName : String(160), customerProjectNumber : String(50), fleetProjectNumber : String(50), fleetProjectCompanyNumber : String(50), ocd : Integer) returns db.Sessions:ID;
}
