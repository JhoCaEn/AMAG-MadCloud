namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {cuid} from '@sap/cds/common';

entity CarConfigurations : cuid {
    configuredAt                               : Date;
    partner                                    : db.Partner   @assert.integrity: false;
    brand                                      : db.Brand     @assert.integrity: false;
    salesOrganisation                          : String(4);
    isNewConfiguration                         : Boolean default false;
    model                                      : db.Model     @assert.integrity: false;
    exteriorColor                              : db.Color     @assert.integrity: false;
    exteriorColorSalesPriceConstraintEquipment : db.Equipment @assert.integrity: false;
    exteriorColorSalesPriceConstraintColor     : db.Color     @assert.integrity: false;
    interiorColor                              : db.Color     @assert.integrity: false;
    interiorColorSalesPriceConstraintEquipment : db.Equipment @assert.integrity: false;
    interiorColorSalesPriceConstraintColor     : db.Color     @assert.integrity: false;
    roofColor                                  : db.Color     @assert.integrity: false;
    roofColorSalesPriceConstraintEquipment     : db.Equipment @assert.integrity: false;
    roofColorSalesPriceConstraintColor         : db.Color     @assert.integrity: false;
    equipments                                 : Composition of many db.CarConfigurationEquipments
                                                     on equipments.configuration = $self;

    preselectedModel                           : db.Model     @assert.integrity: false;
    preselectedExteriorColor                   : db.Color     @assert.integrity: false;
    preselectedInteriorColor                   : db.Color     @assert.integrity: false;
    preselectedRoofColor                       : db.Color     @assert.integrity: false;
    callback                                   : db.Callback;
    preselectedEquipments                      : Composition of many db.CarConfigurationPreselectedEquipments
                                                     on preselectedEquipments.configuration = $self;

    isPrepared                                 : Boolean default false;
    hasSelectableExteriorColors                : Boolean default false;
    hasSelectableInteriorColors                : Boolean default false;
    hasSelectableRoofColors                    : Boolean default false;
    hasValidColorCombination                   : Boolean default false;

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

    selectableModelCategories                  : Association to many db.CarConfigurationSelectableModelCategories
                                                     on selectableModelCategories.configuration = $self;
    selectableSalesTypes                       : Association to many db.CarConfigurationSelectableSalesTypes
                                                     on selectableSalesTypes.configuration = $self;
    selectableModels                           : Association to many db.CarConfigurationSelectableModels
                                                     on selectableModels.configuration = $self;
    selectableColors                           : Association to many db.CarConfigurationSelectableColors
                                                     on selectableColors.configuration = $self;
    selectableColorTypes                       : Association to many db.CarConfigurationSelectableColorTypes
                                                     on selectableColorTypes.configuration = $self;
    selectableColorCombinations                : Association to many db.CarConfigurationSelectableColorCombinations
                                                     on selectableColorCombinations.configuration = $self;
    selectableEquipments                       : Association to many db.CarConfigurationSelectableEquipments
                                                     on selectableEquipments.configuration = $self;
    selectableEquipmentChapters                : Association to many db.CarConfigurationSelectableEquipmentChapters
                                                     on selectableEquipmentChapters.configuration = $self;
    selectableEquipmentCategories              : Association to many db.CarConfigurationSelectableEquipmentCategories
                                                     on selectableEquipmentCategories.configuration = $self;
    selectableModelRestrictions                : Association to many db.CarConfigurationSelectableModelRestrictions
                                                     on selectableModelRestrictions.configuration = $self;
}

type CarConfiguration : Association to CarConfigurations;
