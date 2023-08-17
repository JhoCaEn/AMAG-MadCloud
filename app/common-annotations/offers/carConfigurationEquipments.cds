using {retail.dwb as db} from '../../../db';

annotate db.OfferCarConfigurationEquipments with {
    equipment                     @title               : '{i18n>Equipment}';
    offer                         @title               : '{i18n>Offer}';
    salesPriceConstraintEquipment @title               : '{i18n>CarConfigurations.exteriorColorSalesPriceConstraintEquipment}';
    salesPriceConstraintColor     @title               : '{i18n>CarConfigurations.exteriorColorSalesPriceConstraintColor}';
    salesPriceValue               @title               : '{i18n>General.priceValue}';
    salesPriceValue               @Measures.ISOCurrency: salesPriceValueCurrency;
    salesPriceValueCurrency       @UI.Hidden;
    salesPrice                    @title               : '{i18n>ModelSalesPrice}';
}

annotate db.OfferCarConfigurationEquipments with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Equipment}',
    TypeNamePlural: '{i18n>Equipments}',
    Title         : {
        $Type: 'UI.DataField',
        Value: equipment_id
    }
}};
