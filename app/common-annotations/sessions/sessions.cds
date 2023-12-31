using {retail.dwb as db} from '../../../db';

annotate db.Sessions with {
    ID                        @title: '{i18n>General.ID}';
    salesPartner              @title: '{i18n>SalesPartner}';
    brand                     @title: '{i18n>Brand}';
    projectType               @title: '{i18n>ProjectType}';
    projectCustomerName       @title: '{i18n>Offers.projectCustomerName}';
    customerProjectNumber     @title: '{i18n>Offers.customerProjectNumber}';
    fleetProjectNumber        @title: '{i18n>Offers.fleetProjectNumber}';
    fleetCompanyNumber @title: '{i18n>Offers.fleetCompanyNumber}';
    ocd                       @title: '{i18n>Offers.ocd}';
    isPrepared                @title: '{i18n>Sessions.isPrepared}';
    forwardToOffer            @title: '{i18n>Sessions.forwardToOffer}';
    callbackURL               @title: '{i18n>Callback}';
    offer                     @title: '{i18n>Offer}';
};

annotate db.Sessions with @Common.SemanticKey: [ID];

annotate db.Sessions with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Session}',
    TypeNamePlural: '{i18n>Sessions}',
    Title         : {
        $Type: 'UI.DataField',
        Value: ID
    }
}};
