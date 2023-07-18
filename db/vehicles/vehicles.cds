namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {cuid} from '@sap/cds/common';

entity Vehicles : cuid {
    erpID                : UUID;
    salesOrganisation    : String(4);
    distributionChannel  : String(2);
    organizationDivision : String(2);
    material             : String(40);
    plant                : String(4);
    salesPartner         : db.Partner   @assert.integrity: false;
    dealerPartner        : db.Partner   @assert.integrity: false;
    soldToPartner        : db.Partner   @assert.integrity: false;
    shipToPartner        : db.Partner   @assert.integrity: false;
    billToPartner        : db.Partner   @assert.integrity: false;
    paidByPartner        : db.Partner   @assert.integrity: false;
    brand                : db.Brand     @assert.integrity: false;
    salesType            : db.SalesType @assert.integrity: false;
    model                : db.Model     @assert.integrity: false;
    exteriorColor        : db.Color     @assert.integrity: false;
    interiorColor        : db.Color     @assert.integrity: false;
    roofColor            : db.Color     @assert.integrity: false;

    equipments           : Composition of many db.VehicleEquipments
                               on equipments.vehicle = $self;
}

type Vehicle : Association to Vehicles;
