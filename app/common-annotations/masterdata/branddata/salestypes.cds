using {retail.dwb as db} from '../../../../db';

annotate db.SalesTypes with {
    id                @title: '{i18n>General.ID}';
    name              @title: '{i18n>General.name}';
    brand             @title: '{i18n>Brand}';
    material          @title: '{i18n>SalesTypes.material}';
    salesOrganisation @title: '{i18n>SalesTypes.salesOrganisation}';
    createdAt         @title: '{i18n>replicated.createdAt}';
    modifiedAt        @title: '{i18n>replicated.modifiedAt}';
};

annotate db.SalesTypes with @Common.SemanticKey: [
    brand_code,
    id
];

annotate db.SalesTypes with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>SalesType}',
    TypeNamePlural: '{i18n>SalesTypes}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
