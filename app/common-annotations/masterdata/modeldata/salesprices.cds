using {retail.dwb as db} from '../../../../db';

annotate db.ModelSalesPrices with {
    model      @title               : '{i18n>Model}';
    validFrom  @title               : '{i18n>General.validFrom}';
    validTo    @title               : '{i18n>General.validTo}';
    value      @title               : '{i18n>General.priceValue}';
    currency   @title               : '{i18n>General.currency}';
    createdAt  @title               : '{i18n>replicated.createdAt}';
    modifiedAt @title               : '{i18n>replicated.modifiedAt}';
};

annotate db.ModelSalesPrices with @Common.SemanticKey: [
    model_id,
    validFrom
];

annotate db.ModelSalesPrices with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelSalesPrice}',
    TypeNamePlural: '{i18n>ModelSalesPrices}'
}};
