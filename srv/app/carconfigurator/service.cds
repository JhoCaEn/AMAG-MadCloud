using {retail.dwb as db} from '../../../db';

@path: '/app/backend/carconfigurator'
service AppCarConfiguratorService {

    action createConfiguration(configuredAt : db.CarConfiguration:configuredAt, partner_id : db.CarConfiguration:partner.id, brand_code : db.CarConfiguration:brand.code, salesOrganisation : db.CarConfiguration:salesOrganisation, isNewConfiguration : Boolean, model_id : db.Models:id, exteriorColor_id : db.Colors:id, interiorColor_id : db.Colors:id, roofColor_id : db.Colors:id, equipments : many db.Equipments:id) returns db.CarConfiguration:ID;

    action readConfiguration(ID : UUID)                                                                                                                                                                                                                                                                                                                                                                                        returns {
        configuredAt : Date;
        model_id : db.Models:id;
        exteriorColor_id : db.Colors:id;
        interiorColor_id : db.Colors:id;
        roofColor_id : db.Colors:id;
        equipments : many db.Equipments:id;
    };

    @odata.draft.enabled
    entity Configurations                as projection on db.CarConfigurations actions {
        action prepare(in : $self);
        action selectModel(in : $self, id : db.Model:id);
        action selectColor(in : $self, id : db.Color:id);
        action selectEquipment(in : $self, id : db.Equipments:id);
        action unselectColor(in : $self, id : db.Color:id);
        action unselectEquipment(in : $self, id : db.Equipments:id);
    };

    @readonly
    entity ConfigurationEquipments       as projection on db.CarConfigurationEquipments;

    @readonly
    entity PreselectedEquipments         as projection on db.CarConfigurationPreselectedEquipments {
        key configuration,
        key equipment.id,
            equipment.displayName
    };


    @readonly
    entity SelectableModelCategories     as projection on db.CarConfigurationSelectableModelCategories {
        key configuration,
        key category.code,
            category.name
    };

    @readonly
    entity SelectableSalesTypes          as projection on db.CarConfigurationSelectableSalesTypes {
        key configuration,
        key salesType.id,
            salesType.name
    }

    @readonly
    entity SelectableModels              as projection on db.CarConfigurationSelectableModels {
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
            selected
    };

    @readonly
    entity SelectableColors              as projection on db.CarConfigurationSelectableColors {
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
    entity SelectableColorTypes          as projection on db.CarConfigurationSelectableColorTypes {
        key configuration,
        key type.code,
            type.name,
            selected,
            color,
            colors,
            type @cds.api.ignore,
    };

    @readonly
    entity SelectableColorCombinations   as projection on db.CarConfigurationSelectableColorCombinations {
        key configuration,
        key exterior.id as exterior_id,
        key interior.id as interior_id,
        key roof.id     as roof_id
    };

    @readonly
    entity SelectableEquipments          as projection on db.CarConfigurationSelectableEquipments {
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
    entity SelectableEquipmentChapters   as projection on db.CarConfigurationSelectableEquipmentChapters {
        key configuration,
        key chapter.id,
            chapter.name,
            chapter.characteristicName,
            chapter.isVisibleInConfigurator
    };

    @readonly
    entity SelectableEquipmentCategories as projection on db.CarConfigurationSelectableEquipmentCategories {
        key configuration,
        key category.id,
            category.name,
            selected,
            equipment
    };

    @readonly
    entity SelectableModelSalesPrices    as projection on db.CarConfigurationSelectableModelSalesPrices {
        key configuration,
        key salesPrice.model,
            salesPrice.validFrom,
            salesPrice.validTo,
            salesPrice.value,
            salesPrice.currency
    };

    @readonly
    entity SelectableModelRestrictions    as projection on db.CarConfigurationSelectableModelRestrictions {
        key configuration,
        key modelRestriction.model,
            modelRestriction.id
    };
}
