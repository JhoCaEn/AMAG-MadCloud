using AppSessionsService as service from '../../../../srv';

annotate service.Sessions with @UI: {

    Facets             : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneralFacet',
            Label : '{i18n>General.FieldGroup.General}',
            Target: '@UI.FieldGroup#General'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'ProjectFacet',
            Label : '{i18n>Sessions.FieldGroup.Project}',
            Target: '@UI.FieldGroup#Project'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'ProcessFacet',
            Label : '{i18n>Sessions.FieldGroup.Process}',
            Target: '@UI.FieldGroup#Process'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'WiPFacet',
            Label : 'WiP',
            Target: '@UI.FieldGroup#WiP'
        }
    ],


    FieldGroup #General: {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: salesPartner_id
            },
            {
                $Type: 'UI.DataField',
                Value: brand_code
            },
        ]
    },

    FieldGroup #Project: {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>Sessions.FieldGroup.Project}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: projectType_code
            },
            {
                $Type: 'UI.DataField',
                Value: projectCustomerName
            },
            {
                $Type: 'UI.DataField',
                Value: customerProjectNumber
            },
            {
                $Type: 'UI.DataField',
                Value: fleetProjectNumber
            },
            {
                $Type: 'UI.DataField',
                Value: fleetCompanyNumber
            },
        ]
    },

    FieldGroup #Process: {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>Sessions.FieldGroup.Process}',
        Data : [{
            $Type: 'UI.DataField',
            Value: ocd
        }, ]
    },

    FieldGroup #WiP    : {
        $Type: 'UI.FieldGroupType',
        Label: 'WiP',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: isPrepared
            },
            {
                $Type: 'UI.DataField',
                Value: forwardToOffer
            },
            {
                $Type: 'UI.DataField',
                Value: offer_ID
            },
            {
                $Type: 'UI.DataField',
                Value: callbackURL
            }
        ]
    },

    FieldGroup #Header : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.Header}',
        Data : [{
            $Type: 'UI.DataField',
            Value: ID
        }, ]
    }
};
