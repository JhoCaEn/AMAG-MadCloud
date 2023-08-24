using AppSessionsService as service from '.';

annotate service.Sessions with {
    salesPartner              @Core.Immutable;
    brand                     @Core.Immutable;
    projectType               @Core.Immutable;
    projectCustomerName       @Core.Immutable;
    customerProjectNumber     @Core.Immutable;
    fleetProjectNumber        @Core.Immutable;
    fleetCompanyNumber @Core.Immutable;
    ocd                       @Core.Immutable;
    isPrepared                @Core.Computed;
    forwardToOffer            @Core.Computed;
    callbackURL               @Core.Computed;
    offer                     @Core.Computed;
}
