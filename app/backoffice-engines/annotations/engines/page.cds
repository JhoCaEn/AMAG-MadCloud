using AppBackofficeEnginesService as service from '../../../../srv';

annotate service.Engines with @UI.Identification: [{
    $Type : 'UI.DataFieldForAction',
    Label : '{i18n>General.Actions.synchronise}',
    Action: 'AppBackofficeEnginesService.synchronise'
}];

annotate service.Engines with @UI: {
    HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'SynchronisedFacet',
            Label : '{i18n>General.FieldGroup.Synchronised}',
            Target: '@UI.FieldGroup#Synchronised'
        },    
    ],

    Facets             : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneralFacet',
            Label : '{i18n>General.FieldGroup.General}',
            Target: '@UI.FieldGroup#General'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'TranslationsFacet',
            Label : '{i18n>General.FieldGroup.Translations}',
            Target: 'texts/@UI.PresentationVariant'
        }
    ],

    FieldGroup #General: {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: brand_code,
            },
            {
                $Type: 'UI.DataField',
                Value: cylinders
            },
            {
                $Type: 'UI.DataField',
                Value: fuelTypeId,
            },
            {
                $Type: 'UI.DataField',
                Value: unit
            },
            {
                $Type: 'UI.DataField',
                Value: powerHP
            },
            {
                $Type: 'UI.DataField',
                Value: powerKW
            },
            {
                $Type: 'UI.DataField',
                Value: capacity
            },
        ]
    },

    FieldGroup #Synchronised : {
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

    FieldGroup #Header : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.Header}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: id
            },
            {
                $Type: 'UI.DataField',
                Value: name
            },
        ]
    },
};
