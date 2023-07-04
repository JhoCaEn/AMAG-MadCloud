using AppBackofficeEquipmentsService as service from '../../../../srv';

annotate service.Equipments with @UI.Identification: [{
    $Type : 'UI.DataFieldForAction',
    Label : '{i18n>General.Actions.synchronise}',
    Action: 'AppBackofficeEquipmentsService.synchronise'
}];

annotate service.Equipments with @UI: {
    HeaderFacets            : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'SynchronisedFacet',
        Label : '{i18n>General.FieldGroup.Synchronised}',
        Target: '@UI.FieldGroup#Synchronised'
    }, ],

    Facets                  : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneralFacet',
            Label : '{i18n>General.FieldGroup.General}',
            Target: '@UI.FieldGroup#General'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'BrandFacet',
            Label : '{i18n>General.FieldGroup.Translations}',
            Target: 'texts/@UI.PresentationVariant'
        }
    ],

    FieldGroup #General     : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: brand_code
            },            
            {
                $Type: 'UI.DataField',
                Value: code
            },
            {
                $Type: 'UI.DataField',
                Value: technicalKey,
            },
            {
                $Type: 'UI.DataField',
                Value: chapterId,
            },
            {
                $Type: 'UI.DataField',
                Value: categoryId,
            },
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
                Value: id
            },
            {
                $Type: 'UI.DataField',
                Value: name
            },
            {
                $Type: 'UI.DataField',
                Value: displayName
            },
        ]
    },
};
