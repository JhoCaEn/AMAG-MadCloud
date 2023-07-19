using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipments with {
    model     @UI.Hidden;
    equipment @UI.Hidden;

    id       @Common          : {
        SemanticObject       : 'DWBBOEquipment',
        SemanticObjectMapping: [{
            LocalProperty         : id,
            SemanticObjectProperty: 'id'
        }]
    };     

    categoryId  @title : '{i18n>EquipmentCategory}';
    categoryId  @Common: {
        Text           : category.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };
    categoryId @Common.ValueList: {
        CollectionPath: 'EquipmentCategories',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: categoryId,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterIn',
                LocalDataProperty: model.brand_code,
                ValueListProperty: 'brand_code'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };  

    chapterId  @title : '{i18n>EquipmentChapter}';
    chapterId  @Common: {
        Text           : chapter.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };
    chapterId @Common.ValueList: {
        CollectionPath: 'EquipmentChapters',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: chapterId,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterIn',
                LocalDataProperty: model.brand_code,
                ValueListProperty: 'brand_code'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };          
};

annotate service.ModelEquipments with @Common.SemanticKey: [
    model_id,
    id
];

annotate service.ModelEquipments with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Equipment}',
    TypeNamePlural: '{i18n>Equipments}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: displayName
    }
}};

annotate service.ModelStandardEquipments with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>StandardEquipment}',
    TypeNamePlural: '{i18n>StandardEquipments}'
}};

annotate service.ModelExtraEquipments with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ExtraEquipment}',
    TypeNamePlural: '{i18n>ExtraEquipments}'
}};

annotate service.ModelEquipments with @Capabilities: {FilterRestrictions: {
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