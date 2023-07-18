using AppBackofficeBrandsService as service from '../../../../srv';

annotate service.BrandCharacteristics with {
    brand          @UI.Hidden;
    characteristic @UI.Hidden;
    code           @title : '{i18n>Characteristic}';
    code           @Common: {
        Text           : name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues,
        ValueList      : {
            CollectionPath: 'Characteristics',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: code,
                    ValueListProperty: 'code'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplay',
                    ValueListProperty: 'name'
                }
            ]
        }
    };
    name           @UI.Hidden;
    name           @title : '{i18n>Characteristic}';
};

annotate service.BrandCharacteristics with @Common.SemanticKey: [
    brand_code,
    code
];

annotate service.BrandCharacteristics with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Characteristic}',
    TypeNamePlural: '{i18n>Characteristics}'
}};

annotate service.BrandCharacteristics with @Capabilities: {FilterRestrictions: {
    $Type                       : 'Capabilities.FilterRestrictionsType',
    FilterExpressionRestrictions: [
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : createdAt,
            AllowedExpressions: 'SingleRange',
        },
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : modifiedAt,
            AllowedExpressions: 'SingleRange',
        },

    ]
}};
