using {retail.dwb as db} from '../../../../db';

annotate db.ModelSalesPrices with {
    model      @title               : '{i18n>Model}';
    validFrom  @title               : '{i18n>General.validFrom}';
    validTo    @title               : '{i18n>General.validTo}';
    value      @title               : '{i18n>ModelSalesPrices.value}';
    currency   @title               : '{i18n>ModelSalesPrices.currency}';
    // value      @Measures.ISOCurrency: currency;
    modifiedAt @title               : '{i18n>replicated.modifiedAt}';
    createdAt  @title               : '{i18n>replicated.createdAt}';
};

annotate db.ModelSalesPrices with @Common.SemanticKey: [
    model_id,
    validFrom
];


annotate db.ModelSalesPrices with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>SalesPrice}',
    TypeNamePlural: '{i18n>SalesPrices}',
    Title         : {
        $Type: 'UI.DataField',
        Value: validTo
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: validTo
    }
}};
