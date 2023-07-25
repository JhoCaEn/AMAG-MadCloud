using {retail.dwb as db} from '../../../db';

annotate db.Sessions with {
    ID                        @title: '{i18n>General.ID}';
    salesPartner              @title: '{i18n>SalesPartner}';
    brand                     @title: '{i18n>Brand}';
    projectType               @title: '{i18n>ProjectType}';
    customerProjectName       @title: '{i18n>Offers.customerProjectName}';
    customerProjectNumber     @title: '{i18n>Offers.customerProjectNumber}';
    fleetProjectNumber        @title: '{i18n>Offers.fleetProjectNumber}';
    fleetProjectCompanyNumber @title: '{i18n>Offers.fleetProjectCompanyNumber}';
    ocd                       @title: '{i18n>Offers.ocd}';
    isPrepared                @title: '{i18n>Sessions.isPrepared}';
    forwardToOffer            @title: '{i18n>Sessions.forwardToOffer}';
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
