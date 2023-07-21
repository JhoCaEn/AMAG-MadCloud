namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {
    cuid,
    managed
} from '@sap/cds/common';

@assert.unique: {businessKey: [ocd]}
entity Offers : cuid, managed {
    ocd                           : Integer;
    customerProjectName           : String(160);
    customerProjectNumber         : String(50);
    fleetProjectNumber            : String(50);
    fleetProjectCompanyNumber     : String(10);
    createdBySalesSystem          : Boolean default false;
    brand                         : db.Brand;
    salesPartner                  : db.SalesPartner;
    carConfigurationID            : db.CarConfiguration:ID;
    carConfigurationIsValid       : Boolean default false;
    carConfigurationConfiguredAt  : Date;
    carConfigurationModel         : db.Model;
    carConfigurationExteriorColor : db.Color;
    carConfigurationInteriorColor : db.Color;
    carConfigurationRoofColor     : db.Color;
    callback                      : db.Callback;
    projectType                   : db.ProjectType;


    selectableBrands              : Association to many db.OfferSelectableBrands
                                        on selectableBrands.offer = $self;

    carConfigurationEquipments    : Composition of many db.OfferCarConfigurationEquipments
                                        on carConfigurationEquipments.offer = $self;

    hasSalesPartner               : Boolean default false;
};

type Offer : Association to Offers;
