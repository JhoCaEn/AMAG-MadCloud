using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipmentPackageContents with {
    package   @UI.Hidden;
    equipment @UI.Hidden; 
};

annotate service.ModelEquipmentPackageContents with @Common.SemanticKey: [
    package_model_id,
    package_equipment_id,
    id
];

annotate service.ModelEquipmentPackageContents with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>EquipmentPackageContent}',
    TypeNamePlural: '{i18n>EquipmentPackageContents}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: displayName
    }
}};