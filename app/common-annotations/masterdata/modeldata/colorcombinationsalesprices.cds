using {retail.dwb as db} from '../../../../db';

annotate db.ModelColorCombinationSalesPrices with {
    colorCombination    @title               : '{i18n>ColorCombination}';
    type                @title               : '{i18n>ColorType}';
    constraintEquipment @title               : '{i18n>SalesPrice.constraintEquipment}';
    constraintColor     @title               : '{i18n>SalesPrice.constraintColor}';
    validFrom           @title               : '{i18n>General.validFrom}';
    validTo             @title               : '{i18n>General.validTo}';
    value               @title               : '{i18n>SalesPrice.value}';
    value               @Measures.ISOCurrency: currency;    
    currency            @UI.Hidden;
    weighting           @title               : '{i18n>SalesPrice.weighting}';
    createdAt           @title               : '{i18n>replicated.createdAt}';
    modifiedAt          @title               : '{i18n>replicated.modifiedAt}';
};

annotate db.ModelColorCombinationSalesPrices with @Common.SemanticKey: [
    colorCombination_model_id,
    colorCombination_interior_id,
    colorCombination_exterior_id,
    colorCombination_roof_id,
    type_code,
    constraintEquipment_id,
    constraintColor_id,
    validFrom
];


annotate db.ModelColorCombinationSalesPrices with @UI: {
    HeaderInfo                  : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : '{i18n>ModelColorCombinationSalesPrice}',
        TypeNamePlural: '{i18n>ModelColorCombinationSalesPrices}',
        Title         : {
            $Type : 'UI.DataFieldForAnnotation',
            Target: '@UI.ConnectedFields#HeaderTitle',
        }
    },

    ConnectedFields #HeaderTitle: {
        $Type   : 'UI.ConnectedFieldsType',
        Template: '{exterior_id} / {interior_id} / {roof_id}',
        Data    : {
            $Type      : 'Core.Dictionary',
            exterior_id: {
                $Type: 'UI.DataField',
                Value: colorCombination_exterior_id,
            },
            interior_id: {
                $Type: 'UI.DataField',
                Value: colorCombination_interior_id,
            },
            roof_id    : {
                $Type: 'UI.DataField',
                Value: colorCombination_roof_id,
            }
        },
    }
};
