namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {cuid} from '@sap/cds/common';

entity CarConfigurations : cuid {
    configuredAt                  : Date;
    partner                       : db.Partner @assert.integrity: false;
    brand                         : db.Brand   @assert.integrity: false;
    salesOrganisation             : String(4);
    isNewConfiguration            : Boolean default false;
    model                         : db.Model   @assert.integrity: false;
    exteriorColor                 : db.Color   @assert.integrity: false;
    interiorColor                 : db.Color   @assert.integrity: false;
    roofColor                     : db.Color   @assert.integrity: false;
    equipments                    : Composition of many db.CarConfigurationEquipments
                                        on equipments.configuration = $self;

    preselectedModel              : db.Model   @assert.integrity: false;
    preselectedExteriorColor      : db.Color   @assert.integrity: false;
    preselectedInteriorColor      : db.Color   @assert.integrity: false;
    preselectedRoofColor          : db.Color   @assert.integrity: false;
    preselectedEquipments         : Composition of many db.CarConfigurationPreselectedEquipments
                                        on preselectedEquipments.configuration = $self;

    isPrepared                    : Boolean default false;
    hasSelectableExteriorColors   : Boolean default false;
    hasSelectableInteriorColors   : Boolean default false;
    hasSelectableRoofColors       : Boolean default false;
    hasValidColorCombination      : Boolean default false;

    selectableModelCategories     : Association to many db.CarConfigurationSelectableModelCategories
                                        on selectableModelCategories.configuration = $self;
    selectableSalesTypes          : Association to many db.CarConfigurationSelectableSalesTypes
                                        on selectableSalesTypes.configuration = $self;
    selectableModels              : Association to many db.CarConfigurationSelectableModels
                                        on selectableModels.configuration = $self;
    selectableColors              : Association to many db.CarConfigurationSelectableColors
                                        on selectableColors.configuration = $self;
    selectableColorTypes          : Association to many db.CarConfigurationSelectableColorTypes
                                        on selectableColorTypes.configuration = $self;
    selectableColorCombinations   : Association to many db.CarConfigurationSelectableColorCombinations
                                        on selectableColorCombinations.configuration = $self;
    selectableEquipments          : Association to many db.CarConfigurationSelectableEquipments
                                        on selectableEquipments.configuration = $self;
    selectableEquipmentChapters   : Association to many db.CarConfigurationSelectableEquipmentChapters
                                        on selectableEquipmentChapters.configuration = $self;
    selectableEquipmentCategories : Association to many db.CarConfigurationSelectableEquipmentCategories
                                        on selectableEquipmentCategories.configuration = $self;
    selectableModelSalesPrices    : Association to many db.CarConfigurationSelectableModelSalesPrices
                                        on selectableModelSalesPrices.configuration = $self;
    selectableModelRestrictions   : Association to many db.CarConfigurationSelectableModelRestrictions
                                        on selectableModelRestrictions.configuration = $self;
}

type CarConfiguration : Association to CarConfigurations;
