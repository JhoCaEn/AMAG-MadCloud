using AppBackofficeBrandsService as service from '../../../../srv';

annotate service.BrandCharacteristics with @UI.Identification: [{
    $Type : 'UI.DataFieldForAction',
    Label : '{i18n>General.Actions.synchronise}',
    Action: 'AppBackofficeBrandsService.synchroniseCharacteristic'
}];

annotate service.BrandCharacteristics with @UI: {

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
        }],
    }],

    FieldGroup #General     : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: value,
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
