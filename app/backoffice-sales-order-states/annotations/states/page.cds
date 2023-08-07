using AppBackofficeSalesOrderStatesService as service from '../../../../srv';
using from './text-list';
using from '../transformations/list';

annotate service.States with @UI: {Facets: [
    {
        $Type : 'UI.ReferenceFacet',
        ID    : 'TranslationsFacet',
        Label : '{i18n>General.FieldGroup.Translations}',
        Target: 'texts/@UI.PresentationVariant'
    },
    {
        $Type : 'UI.ReferenceFacet',
        ID    : 'TransformationsFacet',
        Label : '{i18n>BackofficeSalesOrderStates.FieldGroup.Transformations}',
        Target: 'transformations/@UI.PresentationVariant'
    }
]};
