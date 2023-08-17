using {retail.dwb as db} from '../../../db';

annotate db.Partners with {
    id                   @title: '{i18n>General.ID}';
    name                 @title: '{i18n>General.name}';
    hasBrands            @title: '{i18n>Partner.hasBrands}';
    hasContracts         @title: '{i18n>Partner.hasContracts}';
    isSalesPartner       @title: '{i18n>Partner.isSalesPartner}';
    validFrom            @title: '{i18n>General.validFrom}';
    validTo              @title: '{i18n>General.validTo}';
    fullName             @title: '{i18n>Partner.fullName}';
    streetName           @title: '{i18n>Partner.streetName}';
    houseNumber          @title: '{i18n>Partner.houseNumber}';
    postalCode           @title: '{i18n>Partner.postalCode}';
    cityName             @title: '{i18n>Partner.cityName}';
    phoneNumber          @title: '{i18n>Partner.phoneNumber}';
    emailAddress         @title: '{i18n>Partner.emailAddress}';
    usedInSoldToPartners @title: '{i18n>Partner.usedInSoldToPartners}';
    usedInShipToPartners @title: '{i18n>Partner.usedInShipToPartners}';
    usedInBillToPartners @title: '{i18n>Partner.usedInBillToPartners}';
    usedInPaidByPartners @title: '{i18n>Partner.usedInPaidByPartners}';
    createdAt            @title: '{i18n>replicated.createdAt}';
    modifiedAt           @title: '{i18n>replicated.modifiedAt}';
};

annotate db.Partners with @Common.SemanticKey: [id];

annotate db.Partners with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Partner}',
    TypeNamePlural: '{i18n>Partners}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
