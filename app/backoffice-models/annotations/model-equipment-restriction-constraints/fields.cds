using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipmentRestrictionConstraints with {
    restriction @UI.Hidden;
    equipment   @UI.Hidden;

    id @Common.ValueList: {
        CollectionPath: 'Equipments',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterIn',
                LocalDataProperty: restriction.equipment.model.brand_code,
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
    id       @Common          : {
        SemanticObject       : 'DWBBOEquipment',
        SemanticObjectMapping: [{
            LocalProperty         : id,
            SemanticObjectProperty: 'id'
        }]
    };      
};

annotate service.ModelEquipmentRestrictionConstraints with @Common.SemanticKey: [id];

annotate service.ModelEquipmentRestrictionConstraints with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Constraint}',
    TypeNamePlural: '{i18n>Constraints}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: displayName
    }
}};
