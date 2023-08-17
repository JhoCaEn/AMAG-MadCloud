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

    Facets                  : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneralFacet',
        Label : '{i18n>General.FieldGroup.General}',
        Target: '@UI.FieldGroup#General'
    },{
        $Type : 'UI.ReferenceFacet',
        ID    : 'DefaultsFacet',
        Label : '{i18n>BackofficeOrderControls.FieldGroup.Defaults}',
        Target: '@UI.FieldGroup#Defaults'
    },
    {
        $Type : 'UI.ReferenceFacet',
        ID    : 'PartnerRolesFacet',
        Label : '{i18n>BackofficeOrderControls.FieldGroup.PartnerRoles}',
        Target: '@UI.FieldGroup#PartnerRoles'
    },
    {
        $Type : 'UI.ReferenceFacet',
        ID    : 'VisibilitiesFacet',
        Label : '{i18n>BackofficeOrderControls.FieldGroup.Visibilities}',
        Target: '@UI.FieldGroup#Visibilities'
    }],

    FieldGroup #General      : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
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

    FieldGroup #Defaults     : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>BackofficeOrderControls.FieldGroup.Defaults}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: deliveryCode_code
            },
            {
                $Type: 'UI.DataField',
                Value: orderType_code
            },                       
            {
                $Type: 'UI.DataField',
                Value: availability_code
            }
        ]
    },

    FieldGroup #PartnerRoles: {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>BackofficeOrderControls.FieldGroup.PartnerRoles}',
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
            }
        ]
    },

    FieldGroup #Visibilities: {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>BackofficeOrderControls.FieldGroup.Visibilities}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: releasedForPartner
            },
            {
                $Type: 'UI.DataField',
                Value: forEmployee
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
};
