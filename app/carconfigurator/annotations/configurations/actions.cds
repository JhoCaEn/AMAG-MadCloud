using AppCarConfiguratorService as service from '../../../../srv';

annotate service.Configurations actions {
    selectModel(id         @mandatory,
    id                     @title           : '{i18n>Model}',
    id                     @Common.ValueList: {
        CollectionPath: 'SelectableModels',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterIn',
                LocalDataProperty: in.ID,
                ValueListProperty: 'configuration_ID'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: id,
                ValueListProperty: 'id'
            }
        ]
    } );


    selectColor(id         @mandatory,
    id                     @title           : '{i18n>Color}',
    id                     @Common.ValueList: {
        CollectionPath: 'SelectableColors',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterIn',
                LocalDataProperty: in.ID,
                ValueListProperty: 'configuration_ID'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                LocalDataProperty: type_code,
                ValueListProperty: 'type_code'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                LocalDataProperty: displayName,
                ValueListProperty: 'displayName'
            },
        ]
    } );

    selectEquipment(id         @mandatory,
    id                     @title           : 'Equipment',
    id                     @Common.ValueList: {
        CollectionPath: 'SelectableEquipments',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterIn',
                LocalDataProperty: in.ID,
                ValueListProperty: 'configuration_ID'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                LocalDataProperty: category_id,
                ValueListProperty: 'category_id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                LocalDataProperty: displayName,
                ValueListProperty: 'displayName'
            },
        ]
    } );

    unselectColor(id @mandatory,
    id               @title           : '{i18n>Color}',
    id               @Common.ValueList: {
        CollectionPath : 'SelectableColors',
        Parameters     : [
            {
                $Type            : 'Common.ValueListParameterIn',
                LocalDataProperty: in.ID,
                ValueListProperty: 'configuration_ID'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                LocalDataProperty: type_code,
                ValueListProperty: 'type_code'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                LocalDataProperty: displayName,
                ValueListProperty: 'displayName'
            },
        ],
    } );

    unselectEquipment(id @mandatory,
    id               @title           : 'Equipment',
    id               @Common.ValueList: {
        CollectionPath : 'SelectableEquipments',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterIn',
                LocalDataProperty: in.ID,
                ValueListProperty: 'configuration_ID'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                LocalDataProperty: category_id,
                ValueListProperty: 'category_id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                LocalDataProperty: displayName,
                ValueListProperty: 'displayName'
            },
        ]
    } );

}
