using AppSessionsService as service from '../../../srv';

annotate service.Sessions with @UI: {

    Facets                  : [{
        $Type : 'UI.CollectionFacet',
        ID    : 'GeneralSection',
        Label : '{i18n>General.FieldGroup.General}',
        Facets: [{
            $Type : 'UI.CollectionFacet',
            ID    : 'GeneralSubSection',
            Label : '{i18n>General.FieldGroup.General}',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                ID    : 'GeneralFacet',
                Target: '@UI.FieldGroup#General'
            }]
        }]
    }],


    FieldGroup #General     : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: salesPartner_id,
            },
            {
                $Type: 'UI.DataField',
                Value: brand_code,
            },
            {
                $Type: 'UI.DataField',
                Value: projectType_code,
            },
            {
                $Type: 'UI.DataField',
                Value: customerProjectName,
            },
            {
                $Type: 'UI.DataField',
                Value: customerProjectNumber,
            },
            {
                $Type: 'UI.DataField',
                Value: fleetProjectNumber,
            },
            {
                $Type: 'UI.DataField',
                Value: fleetProjectCompanyNumber,
            },
            {
                $Type: 'UI.DataField',
                Value: ocd,
            },
            {
                $Type: 'UI.DataField',
                Value: isPrepared,
            },
            {
                $Type: 'UI.DataField',
                Value: forwardToOffer,
            },
            {
                $Type: 'UI.DataField',
                Value: offer_ID,
            }
        ]
    },

};

annotate service.Sessions with @UI.Identification: [{
    $Type        : 'UI.DataFieldForAction',
    Action       : 'AppSessionsService.prepare',
    Label        : 'WiP: prepare',
    ![@UI.Hidden]: {$edmJson: {$If: [
        {$Or: [
            {$Eq: [
                {$Path: 'isPrepared'},
                true
            ]},
            {$Eq: [
                {$Path: 'IsActiveEntity'},
                false
            ]}
        ]},
        true,
        false
    ]}}
}];
