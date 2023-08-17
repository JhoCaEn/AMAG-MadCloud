using {retail.dwb as db} from '../../../db';

annotate db.CarConfigurationEquipments with {
    equipment                     @title: '{i18n>Equipment}';
    configuration                 @title: '{i18n>CarConfiguration}';
    salesPriceConstraintEquipment @title: '{i18n>CarConfigurations.exteriorColorSalesPriceConstraintEquipment}';
    salesPriceConstraintColor     @title: '{i18n>CarConfigurations.exteriorColorSalesPriceConstraintColor}';
    salesPrice                    @title: '{i18n>ModelSalesPrice}';
}

annotate db.CarConfigurationEquipments with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Equipment}',
    TypeNamePlural: '{i18n>Equipments}',
    Title         : {
        $Type: 'UI.DataField',
        Value: equipment_id
    }
}};
