using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipmentRestrictionOptions with @UI: {
    HeaderInfo: {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : '{i18n>Option}',
        TypeNamePlural: '{i18n>Options}',
        Title         : {
            $Type: 'UI.DataField',
            Value: id
        }
    },
    Facets    : [{
        $Type : 'UI.CollectionFacet',
        ID    : 'ConstraintsSection',
        Label : '{i18n>Rules}',
        Facets: [{
            $Type : 'UI.ReferenceFacet',
            ID    : 'ConstraintsFacet',
            Target: 'rules/@UI.PresentationVariant'
        }]
    }]
};
