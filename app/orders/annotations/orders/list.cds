using AppOrdersService as service from '../../../../srv';

annotate service.Orders with @Common.SemanticKey: [ID];

annotate service.Orders with @UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [ID, ],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : ID,
            Descending: false,
        }, ]
    },

    LineItem           : [{
        $Type: 'UI.DataField',
        Value: ID,
    }, ]
};
