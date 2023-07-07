using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipments with {
    model @UI.Hidden;
    equipment @Common: {
        Text           : equipment.name,
        TextArrangement: #TextOnly
    };
};