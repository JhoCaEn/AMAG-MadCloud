using AppBackofficePurchaseOrderStatesService as service from '../../../srv';

annotate service.PurchaseOrderStates with @UI: {
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
                Value: code,
            },
            {
                $Type: 'UI.DataField',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Value: orderCreated,
            },
            {
                $Type: 'UI.DataField',
                Value: orderReleased,
            }
        ]
    },

};