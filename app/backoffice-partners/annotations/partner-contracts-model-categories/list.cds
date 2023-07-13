using AppBackofficePartnersService as service from '../../../../srv';

annotate service.BrandContractTypeModelCategories with @(UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [modelCategoryCode],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : modelCategoryCode,
            Descending: false,
        }, ]
    },

    LineItem           : [
        {
            $Type                : 'UI.DataField',
            Value                : modelCategoryCode,
            ![@UI.Importance]    : #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type                : 'UI.DataField',
            Value                : modelCategoryName,
            ![@UI.Importance]    : #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        }
    ]
});
