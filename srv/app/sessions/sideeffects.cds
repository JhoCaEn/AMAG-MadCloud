using AppSessionsService as service from '.';

annotate service.Sessions actions {
    prepare   @Common.SideEffects: {
        TargetProperties: [
            'in/isPrepared',
            'in/offer_ID',
            'in/forwardToOffer'
        ]
    };

};