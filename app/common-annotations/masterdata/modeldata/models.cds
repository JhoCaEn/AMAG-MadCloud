using {retail.dwb as db} from '../../../../db';

annotate db.Models with {
    id                        @title: '{i18n>General.ID}';
    name                      @title: '{i18n>General.name}';
    year                      @title: '{i18n>Models.year}';
    code                      @title: '{i18n>General.code}';
    technicalKey              @title: '{i18n>General.technicalKey}';
    releasedForImporteur      @title: '{i18n>Models.releasedForImporteur}';
    releasedForPartner        @title: '{i18n>Models.releasedForPartner}';
    validFrom                 @title: '{i18n>General.validFrom}';
    validTo                   @title: '{i18n>General.validTo}';
    orderableFrom             @title: '{i18n>General.orderableFrom}';
    orderableTo               @title: '{i18n>General.orderableTo}';
    isNetSalesPrices          @title: '{i18n>Models.isNetSalesPrices}';
    isOEMBuildableCheckActive @title: '{i18n>Models.isOEMBuildableCheckActive}';
    brand                     @title: '{i18n>Brand}';
    category                  @title: '{i18n>ModelCategory}';   
    salesType                 @title: '{i18n>SalesType}';
    engine                    @title: '{i18n>Engine}';
    transmission              @title: '{i18n>Transmission}';
    bodyType                  @title: '{i18n>BodyType}';
    createdAt                 @title: '{i18n>replicated.createdAt}';
    modifiedAt                @title: '{i18n>replicated.modifiedAt}';
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
