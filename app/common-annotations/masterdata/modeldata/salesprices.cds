using {retail.dwb as db} from '../../../../db';

annotate db.ModelSalesPrices with {
    validFrom  @title               : '{i18n>General.validFrom}';
    validTo    @title               : '{i18n>General.validTo}';
    value      @title               : '{i18n>ModelSalesPrices.value}';
    value      @Measures.ISOCurrency: currency;
    modifiedAt @title               : '{i18n>replicated.modifiedAt}';
};
