namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {
    cuid,
    managed
} from '@sap/cds/common';
using {
    SalesPriceValue,
    SalesPriceCurrency
} from '../../db';

@assert.unique: {businessKey: [ocd]}
entity Offers : cuid, managed {
    ocd                                                        : Integer;
    projectCustomerName                                        : String(160);
    customerProjectNumber                                      : String(50);
    fleetProjectNumber                                         : String(50);
    fleetCompanyNumber                                  : String(10);
    createdBySalesSystem                                       : Boolean default false;
    brand                                                      : db.Brand;
    isVanConfigurable                                          : Boolean default false;
    isCustomerConfigurationRequestable                         : Boolean default false;
    isOrdered                                                  : Boolean default false;
    salesPartner                                               : db.SalesPartner;
    carConfigurationID                                         : db.CarConfiguration:ID;
    carConfigurationIsValid                                    : Boolean default false;
    configuredAt                               : Date;
    model                                      : db.Model;
    modelSalesPriceValue                       : SalesPriceValue;
    modelSalesPriceCurrency                    : SalesPriceCurrency;
    exteriorColor                              : db.Color;
    exteriorColorSalesPriceConstraintEquipment : db.Equipment;
    exteriorColorSalesPriceConstraintColor     : db.Color;
    exteriorColorSalesPriceValue               : SalesPriceValue;
    exteriorColorSalesPriceCurrency            : SalesPriceCurrency;
    exteriorColorSalesPrice                    : Association to one db.ModelColorCombinationSalesPrices
                                                                     on  exteriorColorSalesPrice.colorCombination.model    =       model
                                                                     and exteriorColorSalesPrice.colorCombination.exterior =       exteriorColor
                                                                     and exteriorColorSalesPrice.colorCombination.interior =       interiorColor
                                                                     and exteriorColorSalesPrice.colorCombination.roof     =       roofColor
                                                                     and exteriorColorSalesPrice.type.code                 =       'E'
                                                                     and exteriorColorSalesPrice.constraintColor           =       exteriorColorSalesPriceConstraintColor
                                                                     and exteriorColorSalesPrice.constraintEquipment       =       exteriorColorSalesPriceConstraintEquipment
                                                                     and current_date                                                      between exteriorColorSalesPrice.validFrom and exteriorColorSalesPrice.validTo;

    interiorColor                              : db.Color;
    interiorColorSalesPriceConstraintEquipment : db.Equipment;
    interiorColorSalesPriceConstraintColor     : db.Color;
    interiorColorSalesPriceValue               : SalesPriceValue;
    interiorColorSalesPriceCurrency            : SalesPriceCurrency;
    interiorColorSalesPrice                    : Association to one db.ModelColorCombinationSalesPrices
                                                                     on  interiorColorSalesPrice.colorCombination.model    =       model
                                                                     and interiorColorSalesPrice.colorCombination.exterior =       exteriorColor
                                                                     and interiorColorSalesPrice.colorCombination.interior =       interiorColor
                                                                     and interiorColorSalesPrice.colorCombination.roof     =       roofColor
                                                                     and interiorColorSalesPrice.type.code                 =       'I'
                                                                     and interiorColorSalesPrice.constraintColor           =       interiorColorSalesPriceConstraintColor
                                                                     and interiorColorSalesPrice.constraintEquipment       =       interiorColorSalesPriceConstraintEquipment
                                                                     and current_date                                                      between interiorColorSalesPrice.validFrom and interiorColorSalesPrice.validTo;

    roofColor                                  : db.Color;
    roofColorSalesPriceConstraintEquipment     : db.Equipment;
    roofColorSalesPriceConstraintColor         : db.Color;
    roofColorSalesPriceValue                   : SalesPriceValue;
    roofColorSalesPriceCurrency                : SalesPriceCurrency;
    roofColorSalesPrice                        : Association to one db.ModelColorCombinationSalesPrices
                                                                     on  roofColorSalesPrice.colorCombination.model    =       model
                                                                     and roofColorSalesPrice.colorCombination.exterior =       exteriorColor
                                                                     and roofColorSalesPrice.colorCombination.interior =       interiorColor
                                                                     and roofColorSalesPrice.colorCombination.roof     =       roofColor
                                                                     and roofColorSalesPrice.type.code                 =       'R'
                                                                     and roofColorSalesPrice.constraintColor           =       roofColorSalesPriceConstraintColor
                                                                     and roofColorSalesPrice.constraintEquipment       =       roofColorSalesPriceConstraintEquipment
                                                                     and current_date                                                  between roofColorSalesPrice.validFrom and roofColorSalesPrice.validTo;
    callback                                                   : db.Callback;
    projectType                                                : db.ProjectType;


    selectableBrands                                           : Association to many db.OfferSelectableBrands
                                                                     on selectableBrands.offer = $self;

    equipments                                 : Composition of many db.OfferCarConfigurationEquipments
                                                                     on equipments.offer = $self;

    hasSalesPartner                                            : Boolean default false;
};

type Offer : Association to Offers;
