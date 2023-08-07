using AppBackofficeVehiclesService as service from '.';

annotate service with @requires: ['authenticated-user'];
