using AppBackofficeOrderControlsService as service from '../../../../srv';

annotate service.OrderControls with @UI.Identification: [{
    $Type : 'UI.DataFieldForAction',
    Label : '{i18n>General.Actions.synchronise}',
    Action: 'AppBackofficeOrderControlsService.synchronise'
}];

annotate service.OrderControls with @UI: {

    HeaderFacets            : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'SynchronisedFacet',
        Label : '{i18n>General.FieldGroup.Synchronised}',
        Target: '@UI.FieldGroup#Synchronised'
    }, ],

    Facets                  : [
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'GeneralSection',
            Label : '{i18n>General.FieldGroup.General}',
            Facets: [
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'GeneralSubSection',
                    Label : '{i18n>General.FieldGroup.General}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'GeneralFacet',
                        Target: '@UI.FieldGroup#General'
                    }]
                }
            ]
        }
    ],

    FieldGroup #General     : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: soldToSource_code,
            },
            {
                $Type: 'UI.DataField',
                Value: soldToPartner_id
            },
            {
                $Type: 'UI.DataField',
                Value: shipToSource_code,
            },
            {
                $Type: 'UI.DataField',
                Value: shipToPartner_id
            },
            {
                $Type: 'UI.DataField',
                Value: billToSource_code
            },
            {
                $Type: 'UI.DataField',
                Value: billToPartner_id
            },
            {
                $Type: 'UI.DataField',
                Value: paidBySource_code
            },
            {
                $Type: 'UI.DataField',
                Value: paidByPartner_id
            },
            {
                $Type: 'UI.DataField',
                Value: releasedForPartner
            },
            {
                $Type: 'UI.DataField',
                Value: forEmployee
            },
            {
                $Type: 'UI.DataField',
                Value: availability_code
            }
        ]
    },

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

    FieldGroup #Header      : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.Header}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: vehicleUsage_code
            },
            {
                $Type: 'UI.DataField',
                Value: customerState_code
            },
            {
                $Type: 'UI.DataField',
                Value: endCustomerState_code
            }
        ]
    },
};
