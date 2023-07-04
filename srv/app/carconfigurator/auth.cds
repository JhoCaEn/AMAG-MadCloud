using AppCarConfiguratorService as service from '.';

annotate service with @requires: ['authenticated-user'];