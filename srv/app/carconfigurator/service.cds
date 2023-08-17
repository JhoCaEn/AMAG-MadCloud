using {retail.dwb as db} from '../../../db';

@path: '/app/backend/carconfigurator'
service AppCarConfiguratorService {

    action createConfiguration(configuredAt : db.CarConfiguration:configuredAt, partner_id : db.CarConfiguration:partner.id, brand_code : db.CarConfiguration:brand.code, salesOrganisation : db.CarConfiguration:salesOrganisation, isNewConfiguration : Boolean, model_id : db.Models:id, exteriorColor_id : db.Colors:id, interiorColor_id : db.Colors:id, roofColor_id : db.Colors:id, equipments : many db.Equipments:id, callback_ID : db.Callbacks:ID) returns db.CarConfiguration:ID;

    action readConfiguration(ID : UUID)                                                                                                                                                                                                                                                                                                                                                                                                                       returns {
        configuredAt : Date;
        model_id : db.Models:id;
        exteriorColor_id : db.Colors:id;
        interiorColor_id : db.Colors:id;
        roofColor_id : db.Colors:id;
        exteriorColorSalesPriceConstraintEquipment_id : db.Equipments:id;
        exteriorColorSalesPriceConstraintColor_id : db.Colors:id;
        interiorColorSalesPriceConstraintEquipment_id : db.Equipments:id;
        interiorColorSalesPriceConstraintColor_id : db.Colors:id;
        roofColorSalesPriceConstraintEquipment_id : db.Equipments:id;
        roofColorSalesPriceConstraintColo_id : db.Colors:id;
        exteriorColorSalesPriceValue : db.CarConfiguration:exteriorColorSalesPriceValue;
        exteriorColorSalesPriceCurrency : db.CarConfiguration:exteriorColorSalesPriceCurrency;
        interiorColorSalesPriceValue : db.CarConfiguration:interiorColorSalesPriceValue;
        interiorColorSalesPriceCurrency : db.CarConfiguration:interiorColorSalesPriceCurrency;
        roofColorSalesPriceValue : db.CarConfiguration:roofColorSalesPriceValue;
        roofColorSalesPriceCurrency : db.CarConfiguration:roofColorSalesPriceCurrency;
        modelSalesPriceValue : db.CarConfiguration:modelSalesPriceValue;
        modelSalesPriceCurrency : db.CarConfiguration:modelSalesPriceCurrency;
        equipments : many {
            id : db.Equipments:id;
            salesPriceConstraintEquipment_id : db.Equipments:id;
            salesPriceConstraintColor_id : db.Colors:id;
            salesPriceValue : db.CarConfigurationEquipments:salesPriceValue;
            salesPriceValueCurrency : db.CarConfigurationEquipments:salesPriceValueCurrency;
        };
    };

    @odata.draft.enabled
    entity Configurations                           as projection on db.CarConfigurations {
        ID,
        configuredAt,
        partner,
        brand,
        salesOrganisation,
        isNewConfiguration,
        model,
        modelSalesPrice,
        exteriorColor,
        exteriorColorSalesPriceConstraintEquipment,
        exteriorColorSalesPriceConstraintColor,
        exteriorColorSalesPrice,
        interiorColor,
        interiorColorSalesPriceConstraintEquipment,
        interiorColorSalesPriceConstraintColor,
        interiorColorSalesPrice,
        roofColor,
        roofColorSalesPriceConstraintEquipment,
        roofColorSalesPriceConstraintColor,
        roofColorSalesPrice,
        preselectedModel,
        preselectedExteriorColor,
        preselectedInteriorColor,
        preselectedRoofColor,
        callback,
        preselectedEquipments,
        isPrepared,
        hasSelectableExteriorColors,
        hasSelectableInteriorColors,
        hasSelectableRoofColors,
        hasValidColorCombination,
        equipments,
        selectableModelCategories,
        selectableSalesTypes,
        selectableModels,
        selectableColors,
        selectableColorTypes,
        selectableColorCombinations,
        selectableEquipments,
        selectableEquipmentChapters,
        selectableEquipmentCategories,
        selectableModelRestrictions,
        exteriorColorSalesPriceValue,
        exteriorColorSalesPriceCurrency,
        interiorColorSalesPriceValue,
        interiorColorSalesPriceCurrency,
        roofColorSalesPriceValue,
        roofColorSalesPriceCurrency,
        modelSalesPriceValue,
        modelSalesPriceCurrency
    } actions {
        action prepare(in : $self);
        action selectModel(in : $self, id : db.Model:id);
        action selectColor(in : $self, id : db.Color:id);
        action selectEquipment(in : $self, id : db.Equipments:id);
        action unselectColor(in : $self, id : db.Color:id);
        action unselectEquipment(in : $self, id : db.Equipments:id);
    };

    @readonly
    entity ConfigurationEquipments                  as projection on db.CarConfigurationEquipments {
        configuration,
        equipment,
        salesPriceConstraintEquipment,
        salesPriceConstraintColor,
        salesPriceValue,
        salesPriceValueCurrency,
        salesPrice
    };

    @readonly
    entity PreselectedEquipments                    as projection on db.CarConfigurationPreselectedEquipments {
        key configuration,
        key equipment,
            equipment.displayName
    };


    @readonly
    entity SelectableModelCategories                as projection on db.CarConfigurationSelectableModelCategories {
        key configuration,
        key category.code,
            category.name
    };

    @readonly
    entity SelectableSalesTypes                     as projection on db.CarConfigurationSelectableSalesTypes {
        key configuration,
        key salesType.id,
            salesType.name
    }

    @readonly
    entity SelectableModels                         as projection on db.CarConfigurationSelectableModels {
        key configuration,
        key model.id,
            model.name,
            model.year,
            model.code,
            model.isNetSalesPrices,
            model.category,
            model.salesType,
            model.engine,
            model.transmission,
            model.bodyType,
            model.validFrom,
            model.validTo,
            model.salesPrice.value as salesPrice,
            model.salesPrice.currency,
            selected,
            model @api.ignore
    };

    @readonly
    entity SelectableColors                         as projection on db.CarConfigurationSelectableColors {
        key configuration,
        key color.id,
            color.code,
            color.name,
            color.displayName,
            type,
            selectable,
            selected
    };

    @readonly
    entity SelectableColorTypes                     as projection on db.CarConfigurationSelectableColorTypes {
        key configuration,
        key type.code,
            type.name,
            selected,
            color,
            colors,
            type @cds.api.ignore,
    };

    @readonly
    entity SelectableColorCombinations              as projection on db.CarConfigurationSelectableColorCombinations {
        key configuration,
        key exterior.id as exterior_id,
        key interior.id as interior_id,
        key roof.id     as roof_id
    };

    @readonly
    entity SelectableEquipments                     as projection on db.CarConfigurationSelectableEquipments {
        key configuration,
        key equipment.id,
            equipment.code,
            equipment.name,
            equipment.displayName,
            selected,
            selectable,
            chapter,
            category
    };

    @readonly
    entity SelectableEquipmentChapters              as projection on db.CarConfigurationSelectableEquipmentChapters {
        key configuration,
        key chapter.id,
            chapter.name,
            chapter.characteristicName,
            chapter.isVisibleInConfigurator
    };

    @readonly
    entity SelectableEquipmentCategories            as projection on db.CarConfigurationSelectableEquipmentCategories {
        key configuration,
        key category.id,
            category.name,
            selected,
            equipment
    };

    @readonly
    entity SelectableModelRestrictions              as projection on db.CarConfigurationSelectableModelRestrictions {
        key configuration,
        key modelRestriction.model,
            modelRestriction.id
    };

    @readonly
    @Capabilities.ReadRestrictions.Readable: false
    entity ModelSalesPrices                         as projection on db.CurrentModelSalesPrices;

    @readonly
    @Capabilities.ReadRestrictions.Readable: false
    entity ModelColorCombinationExteriorSalesPrices as projection on db.CurrentModelColorCombinationExteriorSalesPrices;

    @readonly
    @Capabilities.ReadRestrictions.Readable: false
    entity ModelColorCombinationInteriorSalesPrices as projection on db.CurrentModelColorCombinationInteriorSalesPrices;

    @readonly
    @Capabilities.ReadRestrictions.Readable: false
    entity ModelColorCombinationRoofSalesPrices     as projection on db.CurrentModelColorCombinationRoofSalesPrices;

    @readonly
    @Capabilities.ReadRestrictions.Readable: false
    entity ConfigurationEquipmentSalesPrices        as projection on db.CarConfigurationEquipmentSalesPrices;
}
