namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {
    cuid,
    managed
} from '@sap/cds/common';

@assert.unique: {businessKey: [ocd]}
entity Offers : cuid, managed {
    ocd                                                        : Integer;
    customerProjectName                                        : String(160);
    customerProjectNumber                                      : String(50);
    fleetProjectNumber                                         : String(50);
    fleetProjectCompanyNumber                                  : String(10);
    createdBySalesSystem                                       : Boolean default false;
    brand                                                      : db.Brand;
    salesPartner                                               : db.SalesPartner;
    carConfigurationID                                         : db.CarConfiguration:ID;
    carConfigurationIsValid                                    : Boolean default false;
    carConfigurationConfiguredAt                               : Date;
    carConfigurationModel                                      : db.Model;
    carConfigurationExteriorColor                              : db.Color;
    carConfigurationExteriorColorSalesPriceConstraintEquipment : db.Equipment;
    carConfigurationExteriorColorSalesPriceConstraintColor     : db.Color;
    carConfigurationExteriorColorSalesPrice                    : Association to one db.ModelColorCombinationSalesPrices
                                                                     on  carConfigurationExteriorColorSalesPrice.colorCombination.model    =       carConfigurationModel
                                                                     and carConfigurationExteriorColorSalesPrice.colorCombination.exterior =       carConfigurationExteriorColor
                                                                     and carConfigurationExteriorColorSalesPrice.colorCombination.interior =       carConfigurationInteriorColor
                                                                     and carConfigurationExteriorColorSalesPrice.colorCombination.roof     =       carConfigurationRoofColor
                                                                     and carConfigurationExteriorColorSalesPrice.type.code                 =       'E'
                                                                     and carConfigurationExteriorColorSalesPrice.constraintColor           =       carConfigurationExteriorColorSalesPriceConstraintColor
                                                                     and carConfigurationExteriorColorSalesPrice.constraintEquipment       =       carConfigurationExteriorColorSalesPriceConstraintEquipment
                                                                     and current_date                                                      between carConfigurationExteriorColorSalesPrice.validFrom and carConfigurationExteriorColorSalesPrice.validTo;

    carConfigurationInteriorColor                              : db.Color;
    carConfigurationInteriorColorSalesPriceConstraintEquipment : db.Equipment;
    carConfigurationInteriorColorSalesPriceConstraintColor     : db.Color;
    carConfigurationInteriorColorSalesPrice                    : Association to one db.ModelColorCombinationSalesPrices
                                                                     on  carConfigurationInteriorColorSalesPrice.colorCombination.model    =       carConfigurationModel
                                                                     and carConfigurationInteriorColorSalesPrice.colorCombination.exterior =       carConfigurationExteriorColor
                                                                     and carConfigurationInteriorColorSalesPrice.colorCombination.interior =       carConfigurationInteriorColor
                                                                     and carConfigurationInteriorColorSalesPrice.colorCombination.roof     =       carConfigurationRoofColor
                                                                     and carConfigurationInteriorColorSalesPrice.type.code                 =       'I'
                                                                     and carConfigurationInteriorColorSalesPrice.constraintColor           =       carConfigurationInteriorColorSalesPriceConstraintColor
                                                                     and carConfigurationInteriorColorSalesPrice.constraintEquipment       =       carConfigurationInteriorColorSalesPriceConstraintEquipment
                                                                     and current_date                                                      between carConfigurationInteriorColorSalesPrice.validFrom and carConfigurationInteriorColorSalesPrice.validTo;

    carConfigurationRoofColor                                  : db.Color;
    carConfigurationRoofColorSalesPriceConstraintEquipment     : db.Equipment;
    carConfigurationRoofColorSalesPriceConstraintColor         : db.Color;
    carConfigurationRoofColorSalesPrice                        : Association to one db.ModelColorCombinationSalesPrices
                                                                     on  carConfigurationRoofColorSalesPrice.colorCombination.model    =       carConfigurationModel
                                                                     and carConfigurationRoofColorSalesPrice.colorCombination.exterior =       carConfigurationExteriorColor
                                                                     and carConfigurationRoofColorSalesPrice.colorCombination.interior =       carConfigurationInteriorColor
                                                                     and carConfigurationRoofColorSalesPrice.colorCombination.roof     =       carConfigurationRoofColor
                                                                     and carConfigurationRoofColorSalesPrice.type.code                 =       'R'
                                                                     and carConfigurationRoofColorSalesPrice.constraintColor           =       carConfigurationRoofColorSalesPriceConstraintColor
                                                                     and carConfigurationRoofColorSalesPrice.constraintEquipment       =       carConfigurationRoofColorSalesPriceConstraintEquipment
                                                                     and current_date                                                      between carConfigurationRoofColorSalesPrice.validFrom and carConfigurationRoofColorSalesPrice.validTo;
    callback                                                   : db.Callback;
    projectType                                                : db.ProjectType;


    selectableBrands                                           : Association to many db.OfferSelectableBrands
                                                                     on selectableBrands.offer = $self;

    carConfigurationEquipments                                 : Composition of many db.OfferCarConfigurationEquipments
                                                                     on carConfigurationEquipments.offer = $self;

    hasSalesPartner                                            : Boolean default false;
};

type Offer : Association to Offers;
