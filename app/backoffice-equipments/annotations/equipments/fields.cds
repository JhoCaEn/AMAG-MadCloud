using AppBackofficeEquipmentsService as service from '../../../../srv';

annotate service.Equipments with {
    chapter    @UI.Hidden;
    chapterId  @title           : '{i18n>BackofficeEquipments.EquipmentChapter}';
    chapterId  @Common          : {
        Text           : chapter.name,
        TextArrangement: #TextFirst
    };
    chapterId  @Common.ValueList: {
        CollectionPath: 'Chapters',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: chapterId,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: brand_code,
                ValueListProperty: 'brand_code'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };
    brand      @title           : '{i18n>Brand}';
    brand      @Common          : {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
    category   @UI.Hidden;
    categoryId @title           : '{i18n>BackofficeEquipments.EquipmentCategory}';
    categoryId @Common          : {
        Text           : category.name,
        TextArrangement: #TextOnly
    };
    categoryId @Common.ValueList: {
        CollectionPath: 'Categories',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: categoryId,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: brand_code,
                ValueListProperty: 'brand_code'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };
};

annotate service.Equipments with @Capabilities: {FilterRestrictions: {
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
