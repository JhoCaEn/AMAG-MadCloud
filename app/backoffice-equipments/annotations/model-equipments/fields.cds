using AppBackofficeEquipmentsService as service from '../../../../srv';

annotate service.ModelEquipments with @Common.SemanticKey: [id];

annotate service.ModelEquipments with {
    equipment @UI.Hidden;
};
