using AppOffersService as service from '../../../../srv';

annotate service.Offers with @UI.UpdateHidden: true;

annotate service.Offers actions {
    selectSalesPartner(id @mandatory,
    id                      @title                          : '{i18n>SalesPartner}',
    id                      @Common.ValueListWithFixedValues: true,
    id                      @Common.ValueList               : {
        CollectionPath: 'SalesPartners',
        Parameters    : [{
            $Type            : 'Common.ValueListParameterInOut',
            LocalDataProperty: id,
            ValueListProperty: 'id'
        }]
    } );

    copy                    @(Core.OperationAvailable: {$edmJson: {$Eq: [
        {$Path: 'IsActiveEntity'},
        true
    ]}});

};

annotate service.Offers actions {

    selectBrand(code @mandatory,
    code             @title           : '{i18n>Brand}',
    code             @UI.Hidden       : false,
    code             @Common.ValueList: {
        CollectionPath: 'SelectableBrands',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterIn',
                LocalDataProperty: in.ID,
                ValueListProperty: 'offer_ID'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: code,
                ValueListProperty: 'code'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                LocalDataProperty: name,
                ValueListProperty: 'name'
            },
        ]
    } );
}
