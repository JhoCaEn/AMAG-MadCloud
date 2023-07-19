using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipmentRestrictionOptionRules with {
    option @UI.Hidden;

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
                LocalDataProperty: option.restriction.equipment.model.brand_code,
                ValueListProperty: 'brand_code'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };    

    color   @Common: {
        Text           : color.displayName,
        TextArrangement: #TextFirst
    };
    color @Common.ValueList: {
        CollectionPath: 'Colors',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: color_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterIn',
                LocalDataProperty: option.restriction.equipment.model.brand_code,
                ValueListProperty: 'brand_code'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'type_code'
            },            
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'displayName'
            }
        ]
    }; 
    color       @Common          : {
        SemanticObject       : 'DWBBOColor',
        SemanticObjectMapping: [{
            LocalProperty         : color_id,
            SemanticObjectProperty: 'id'
        }]
    };         

    equipment   @Common: {
        Text           : equipment.displayName,
        TextArrangement: #TextFirst
    };
    equipment @Common.ValueList: {
        CollectionPath: 'Equipments',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: equipment_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterIn',
                LocalDataProperty: option.restriction.equipment.model.brand_code,
                ValueListProperty: 'brand_code'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'chapterId'
            },              
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'categoryId'
            },            
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'displayName'
            }
        ]
    };
    equipment       @Common          : {
        SemanticObject       : 'DWBBOEquipment',
        SemanticObjectMapping: [{
            LocalProperty         : equipment_id,
            SemanticObjectProperty: 'id'
        }]
    };     
};

annotate service.ModelEquipmentRestrictionOptionRules with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>RestrictionRule}',
    TypeNamePlural: '{i18n>RestrictionRules}'
}};

annotate service.ModelEquipmentRestrictionOptionRules with @Capabilities: {FilterRestrictions: {
    $Type                       : 'Capabilities.FilterRestrictionsType',
    FilterExpressionRestrictions: [
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : createdAt,
            AllowedExpressions: 'SingleRange',
        },
    ]
}};