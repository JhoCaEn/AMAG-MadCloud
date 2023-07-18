using AppBackofficeModelsService as service from '../../../../srv';

annotate service.Equipments with {
    brand @UI.Hidden;
    id    @title : '{i18n>Equipment}';
    id    @Common: {
        Text           : displayName,
        TextArrangement: #TextFirst
    };
    categoryId @title : '{i18n>EquipmentCategory}';
    categoryId  @Common: {
        Text           : category.name,
        TextArrangement: #TextOnly,
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
                LocalDataProperty: restriction.model.brand_code,
                ValueListProperty: 'brand_code'
            },        
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };
    
    chapterId @title : '{i18n>EquipmentChapter}';
    chapterId  @Common: {
        Text           : chapter.name,
        TextArrangement: #TextOnly,
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
                LocalDataProperty: restriction.model.brand_code,
                ValueListProperty: 'brand_code'
            },        
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };
}