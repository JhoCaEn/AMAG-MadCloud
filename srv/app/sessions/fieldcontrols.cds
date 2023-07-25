using AppSessionsService as service from '.';

annotate service.Sessions with {
    salesPartner              @Core.Immutable;
    brand                     @Core.Immutable;
    projectType               @Core.Immutable;
    customerProjectName       @Core.Immutable;
    customerProjectNumber     @Core.Immutable;
    fleetProjectNumber        @Core.Immutable;
    fleetProjectCompanyNumber @Core.Immutable;
    ocd                       @Core.Immutable;
    isPrepared                @Core.Computed;
    forwardToOffer            @Core.Computed;
    offer                     @Core.Computed;
}
