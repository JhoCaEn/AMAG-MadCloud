using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerUsedInOrderControlsAsShipToPartners with {
    shipToPartner @UI.Hidden; 
};