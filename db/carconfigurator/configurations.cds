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

    modelSalesPrice                            : Association to one db.CurrentModelSalesPrices
                                                     on modelSalesPrice.model = model;


    exteriorColorSalesPrice                    : Association to one db.CurrentModelColorCombinationExteriorSalesPrices
                                                     on  exteriorColorSalesPrice.model               = model
                                                     and exteriorColorSalesPrice.exterior            = exteriorColor
                                                     and exteriorColorSalesPrice.interior            = interiorColor
                                                     and exteriorColorSalesPrice.roof                = roofColor
                                                     and exteriorColorSalesPrice.constraintColor     = exteriorColorSalesPriceConstraintColor
                                                     and exteriorColorSalesPrice.constraintEquipment = exteriorColorSalesPriceConstraintEquipment;

    interiorColorSalesPrice                    : Association to one db.CurrentModelColorCombinationInteriorSalesPrices
                                                     on  interiorColorSalesPrice.model               = model
                                                     and interiorColorSalesPrice.exterior            = exteriorColor
                                                     and interiorColorSalesPrice.interior            = interiorColor
                                                     and interiorColorSalesPrice.roof                = roofColor
                                                     and interiorColorSalesPrice.constraintColor     = interiorColorSalesPriceConstraintColor
                                                     and interiorColorSalesPrice.constraintEquipment = interiorColorSalesPriceConstraintEquipment;


    roofColorSalesPrice                        : Association to one db.CurrentModelColorCombinationRoofSalesPrices
                                                     on  roofColorSalesPrice.model               = model
                                                     and roofColorSalesPrice.exterior            = exteriorColor
                                                     and roofColorSalesPrice.interior            = interiorColor
                                                     and roofColorSalesPrice.roof                = roofColor
                                                     and roofColorSalesPrice.constraintColor     = roofColorSalesPriceConstraintColor
                                                     and roofColorSalesPrice.constraintEquipment = roofColorSalesPriceConstraintEquipment;

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
