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

entity Vehicles : cuid, managed {
    erpID                                      : UUID;
    salesOrganisation                          : String(4);
    distributionChannel                        : String(2);
    organizationDivision                       : String(2);
    material                                   : String(40);
    plant                                      : String(4);
    configuredAt                               : Date;
    salesPartner                               : db.Partner             @assert.integrity: false;
    dealerPartner                              : db.Partner             @assert.integrity: false;
    soldToPartner                              : db.Partner             @assert.integrity: false;
    shipToPartner                              : db.Partner             @assert.integrity: false;
    billToPartner                              : db.Partner             @assert.integrity: false;
    paidByPartner                              : db.Partner             @assert.integrity: false;
    brand                                      : db.Brand               @assert.integrity: false;
    salesType                                  : db.SalesType           @assert.integrity: false;
    model                                      : db.Model               @assert.integrity: false;
    modelSalesPriceValue                       : SalesPriceValue;
    modelSalesPriceCurrency                    : SalesPriceCurrency;
    usage                                      : db.VehicleUsage        @assert.integrity: false;
    customerState                              : db.CustomerState       @assert.integrity: false;
    endCustomerState                           : db.EndCustomerState    @assert.integrity: false;
    availability                               : db.VehicleAvailability @assert.integrity: false;
    exteriorColor                              : db.Color               @assert.integrity: false;
    exteriorColorSalesPriceConstraintEquipment : db.Equipment           @assert.integrity: false;
    exteriorColorSalesPriceConstraintColor     : db.Color               @assert.integrity: false;
    exteriorColorSalesPriceValue               : SalesPriceValue;
    exteriorColorSalesPriceCurrency            : SalesPriceCurrency;
    interiorColor                              : db.Color               @assert.integrity: false;
    interiorColorSalesPriceConstraintEquipment : db.Equipment           @assert.integrity: false;
    interiorColorSalesPriceConstraintColor     : db.Color               @assert.integrity: false;
    interiorColorSalesPriceValue               : SalesPriceValue;
    interiorColorSalesPriceCurrency            : SalesPriceCurrency;
    roofColor                                  : db.Color               @assert.integrity: false;
    roofColorSalesPriceConstraintEquipment     : db.Equipment           @assert.integrity: false;
    roofColorSalesPriceConstraintColor         : db.Color               @assert.integrity: false;
    roofColorSalesPriceValue                   : SalesPriceValue;
    roofColorSalesPriceCurrency                : SalesPriceCurrency;
    orderType                                  : db.OrderType           @assert.integrity: false;
    deliveryCode                               : db.DeliveryCode        @assert.integrity: false;
    purchaseState                              : db.PurchaseOrderState  @assert.integrity: false;
    orderState                                 : db.SalesOrderState     @assert.integrity: false;
    orderCreated                               : Boolean default false;
    orderReleased                              : Boolean default false;

    exteriorColorSalesPrice                    : Association to one db.ModelColorCombinationSalesPrices
                                                     on  exteriorColorSalesPrice.colorCombination.model    =       model
                                                     and exteriorColorSalesPrice.colorCombination.exterior =       exteriorColor
                                                     and exteriorColorSalesPrice.colorCombination.interior =       interiorColor
                                                     and exteriorColorSalesPrice.colorCombination.roof     =       roofColor
                                                     and exteriorColorSalesPrice.type.code                 =       'E'
                                                     and exteriorColorSalesPrice.constraintColor           =       exteriorColorSalesPriceConstraintColor
                                                     and exteriorColorSalesPrice.constraintEquipment       =       exteriorColorSalesPriceConstraintEquipment
                                                     and current_date                                      between exteriorColorSalesPrice.validFrom and exteriorColorSalesPrice.validTo;

    interiorColorSalesPrice                    : Association to one db.ModelColorCombinationSalesPrices
                                                     on  interiorColorSalesPrice.colorCombination.model    =       model
                                                     and interiorColorSalesPrice.colorCombination.exterior =       exteriorColor
                                                     and interiorColorSalesPrice.colorCombination.interior =       interiorColor
                                                     and interiorColorSalesPrice.colorCombination.roof     =       roofColor
                                                     and interiorColorSalesPrice.type.code                 =       'I'
                                                     and interiorColorSalesPrice.constraintColor           =       interiorColorSalesPriceConstraintColor
                                                     and interiorColorSalesPrice.constraintEquipment       =       interiorColorSalesPriceConstraintEquipment
                                                     and current_date                                      between interiorColorSalesPrice.validFrom and interiorColorSalesPrice.validTo;


    roofColorSalesPrice                        : Association to one db.ModelColorCombinationSalesPrices
                                                     on  roofColorSalesPrice.colorCombination.model    =       model
                                                     and roofColorSalesPrice.colorCombination.exterior =       exteriorColor
                                                     and roofColorSalesPrice.colorCombination.interior =       interiorColor
                                                     and roofColorSalesPrice.colorCombination.roof     =       roofColor
                                                     and roofColorSalesPrice.type.code                 =       'R'
                                                     and roofColorSalesPrice.constraintColor           =       roofColorSalesPriceConstraintColor
                                                     and roofColorSalesPrice.constraintEquipment       =       roofColorSalesPriceConstraintEquipment
                                                     and current_date                                  between roofColorSalesPrice.validFrom and roofColorSalesPrice.validTo;


    equipments                                 : Composition of many db.VehicleEquipments
                                                     on equipments.vehicle = $self;
}

type Vehicle : Association to Vehicles;
