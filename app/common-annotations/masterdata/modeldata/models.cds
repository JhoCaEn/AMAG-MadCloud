using {retail.dwb as db} from '../../../../db';

annotate db.Models with {
    id                        @title: '{i18n>General.ID}';
    name                      @title: '{i18n>General.name}';
    brand                     @title: '{i18n>Brand}';
    year                      @title: '{i18n>Models.year}';
    salesType                 @title: '{i18n>SalesType}';
    engine                    @title: '{i18n>Engine}';
    transmission              @title: '{i18n>Transmission}';
    code                      @title: '{i18n>General.code}';
    modifiedAt                @title: '{i18n>replicated.modifiedAt}';
    bodyType                  @title: '{i18n>BodyType}';
    category                  @title: '{i18n>General.category}';
    createdAt                 @title: '{i18n>replicated.createdAt}';
    isNetSalesPrices          @title: '{i18n>Models.isNetSalesPrices}';
    isOEMBuildableCheckActive @title: '{i18n>Models.isOEMBuildableCheckActive}';
    modelSeries               @title: '{i18n>ModelSerie}';
    orderableFrom             @title: '{i18n>Models.orderableFrom}';
    orderableTo               @title: '{i18n>Models.orderableTo}';
    releasedForImporteur      @title: '{i18n>Models.releasedForImporteur}';
    releasedForPartner        @title: '{i18n>Models.releasedForPartner}';
    technicalKey              @title: '{i18n>General.technicalKey}';
    validFrom                 @title: '{i18n>General.validFrom}';
    validTo                   @title: '{i18n>General.validTo}';
};

annotate db.Models with @Common.SemanticKey: [id];

annotate db.Models with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Model}',
    TypeNamePlural: '{i18n>Models}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
