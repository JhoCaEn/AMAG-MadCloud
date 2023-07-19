using AppSessionsService as service from '../../../srv';

annotate service.Sessions with @UI: {

    HeaderFacets            : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'SynchronisedFacet',
        Label : '{i18n>General.FieldGroup.Synchronised}',
        Target: '@UI.FieldGroup#Synchronised'
    }, ],

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

    FieldGroup #Synchronised: {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.Synchronised}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: createdAt,
                Label: '{i18n>General.FieldGroup.Synchronised.createdAt}'
            },
            {
                $Type: 'UI.DataField',
                Value: modifiedAt,
                Label: '{i18n>General.FieldGroup.Synchronised.modifiedAt}'
            },
        ]
    },


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
