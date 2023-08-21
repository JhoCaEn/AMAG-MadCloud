using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerUsedInOrderControlsAsSoldToPartners with {
    soldToPartner @UI.Hidden; 
};

