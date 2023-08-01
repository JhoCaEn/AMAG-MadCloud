namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {
    cuid,
    managed
} from '@sap/cds/common';

entity Sessions : cuid, managed {
    salesPartner              : db.SalesPartner;
    brand                     : db.Brand;
    projectType               : db.ProjectType;
    customerProjectName       : String(160);
    customerProjectNumber     : String(50);
    fleetProjectNumber        : String(50);
    fleetProjectCompanyNumber : String(50);
    ocd                       : Integer;
    callbackURL               : String;
    isPrepared                : Boolean;
    forwardToOffer            : Boolean;
    offer                     : db.Offer;
}

type Session : Association to Sessions;
