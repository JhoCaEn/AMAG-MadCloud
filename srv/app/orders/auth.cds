using AppOrdersService as service from '.';

annotate service with @requires: ['authenticated-user'];