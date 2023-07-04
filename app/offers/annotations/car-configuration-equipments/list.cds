using AppOffersService as service from '../../../../srv';

annotate service.CarConfigurationEquipments with @UI: {LineItem: [
    {Value: equipment_id}
], };