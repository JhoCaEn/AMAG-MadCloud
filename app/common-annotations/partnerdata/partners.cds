using {retail.dwb as db} from '../../../db';

annotate db.Partners with {
    id           @title: '{i18n>General.ID}';
    name         @title: '{i18n>General.name}';
    hasBrands    @title: '{i18n>Partner.hasBrands}';
    hasContracts @title: '{i18n>Partner.hasContracts}';
    validFrom    @title: '{i18n>General.validFrom}';
    validTo      @title: '{i18n>General.validTo}';
    createdAt    @title: '{i18n>replicated.createdAt}';
    modifiedAt   @title: '{i18n>replicated.modifiedAt}';
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
