using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColors with {
    model @UI.Hidden;
    color @UI.Hidden;

    id    @Common: {
        SemanticObject       : 'DWBBOColor',
        SemanticObjectMapping: [{
            LocalProperty         : id,
            SemanticObjectProperty: 'id'
        }]
    };
};

annotate service.ModelColors with @Common.SemanticKey: [id];

annotate service.ModelColors with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Color}',
    TypeNamePlural: '{i18n>Colors}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: displayName
    }
}};

annotate service.ModelExteriorColors with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ExteriorColor}',
    TypeNamePlural: '{i18n>ExteriorColors}'
}};

annotate service.ModelInteriorColors with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>InteriorColor}',
    TypeNamePlural: '{i18n>InteriorColors}'
}};

annotate service.ModelRoofColors with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>RoofColor}',
    TypeNamePlural: '{i18n>RoofColors}'
}};

annotate service.ModelColors with @Capabilities: {FilterRestrictions: {
    $Type                       : 'Capabilities.FilterRestrictionsType',
    FilterExpressionRestrictions: [
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : createdAt,
            AllowedExpressions: 'SingleRange',
        },
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : validFrom,
            AllowedExpressions: 'SingleRange',
        },
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : validTo,
            AllowedExpressions: 'SingleRange',
        },
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : orderableFrom,
            AllowedExpressions: 'SingleRange',
        },
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : orderableTo,
            AllowedExpressions: 'SingleRange',
        },

    ]
}};
