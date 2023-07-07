using AppBackofficeModelsService as service from '.';

annotate service with @requires: ['authenticated-user'];
