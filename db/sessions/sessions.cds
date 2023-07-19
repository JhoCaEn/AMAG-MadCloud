namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {cuid} from '@sap/cds/common';
using {replicated} from '../../db';

entity Sessions : cuid, replicated {
    salesPartner              : db.SalesPartner;
    brand                     : db.Brand;
    projectType               : db.ProjectType;
    customerProjectName       : String(160);
    customerProjectNumber     : String(50);
    fleetProjectNumber        : String(50);
    fleetProjectCompanyNumber : String(50);
    ocd                       : Integer;
    isPrepared                : Boolean;
    forwardToOffer            : Boolean;
    offer                     : db.Offer;
}

type Session : Association to Sessions;
