using {retail.dwb as db} from '../../../db';

annotate db.Sessions with {
    ID                        @title: '{i18n>General.ID}';
    salesPartner              @title: '{i18n>SalesPartner}';
    brand                     @title: '{i18n>Brand}';
    projectType               @title: '{i18n>ProjectType}';
    customerProjectName       @title: '{i18n>Sessions.customerProjectName}';
    customerProjectNumber     @title: '{i18n>Sessions.customerProjectNumber}';
    fleetProjectNumber        @title: '{i18n>Sessions.fleetProjectNumber}';
    fleetProjectCompanyNumber @title: '{i18n>Sessions.fleetProjectCompanyNumber}';
    ocd                       @title: '{i18n>Sessions.ocd}';
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
