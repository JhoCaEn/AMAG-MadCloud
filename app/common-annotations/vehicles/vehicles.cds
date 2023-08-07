using {retail.dwb as db} from '../../../db';

annotate db.Vehicles with {
    ID                                         @title: '{i18n>General.ID}';
    erpID                                      @title: '{i18n>Vehicles.erpID}';
    salesOrganisation                          @title: '{i18n>Vehicles.salesOrganisation}';
    distributionChannel                        @title: '{i18n>Vehicles.distributionChannel}';
    organizationDivision                       @title: '{i18n>Vehicles.organizationDivision}';
    material                                   @title: '{i18n>Vehicles.material}';
    plant                                      @title: '{i18n>Vehicles.plant}';
    salesPartner                               @title: '{i18n>Vehicles.salesPartner}';
    dealerPartner                              @title: '{i18n>Vehicles.dealerPartner}';
    soldToPartner                              @title: '{i18n>Vehicles.soldToPartner}';
    shipToPartner                              @title: '{i18n>Vehicles.shipToPartner}';
    billToPartner                              @title: '{i18n>Vehicles.billToPartner}';
    paidByPartner                              @title: '{i18n>Vehicles.paidByPartner}';
    brand                                      @title: '{i18n>Brand}';
    salesType                                  @title: '{i18n>SalesType}';
    model                                      @title: '{i18n>Model}';
    usage                                      @title: '{i18n>Vehicles.usage}';
    customerState                              @title: '{i18n>CustomerState}';
    endCustomerState                           @title: '{i18n>EndCustomerState}';
    availability                               @title: '{i18n>Vehicles.availability}';
    exteriorColor                              @title: '{i18n>ExteriorColor}';
    exteriorColorSalesPriceConstraintEquipment @title: '{i18n>Vehicles.exteriorColorSalesPriceConstraintEquipment}';
    exteriorColorSalesPriceConstraintColor     @title: '{i18n>Vehicles.exteriorColorSalesPriceConstraintColor}';
    interiorColor                              @title: '{i18n>InteriorColor}';
    interiorColorSalesPriceConstraintEquipment @title: '{i18n>Vehicles.interiorColorSalesPriceConstraintEquipment}';
    interiorColorSalesPriceConstraintColor     @title: '{i18n>Vehicles.interiorColorSalesPriceConstraintColor}';
    roofColor                                  @title: '{i18n>RoofColor}';
    roofColorSalesPriceConstraintEquipment     @title: '{i18n>Vehicles.roofColorSalesPriceConstraintEquipment}';
    roofColorSalesPriceConstraintColor         @title: '{i18n>Vehicles.roofColorSalesPriceConstraintColor}';
    exteriorColorSalesPrice                    @title: '{i18n>Vehicles.exteriorColorSalesPrice}';
    interiorColorSalesPrice                    @title: '{i18n>Vehicles.interiorColorSalesPrice}';
    roofColorSalesPrice                        @title: '{i18n>Vehicles.roofColorSalesPrice}';
    equipments                                 @title: '{i18n>Equipments}';
    createdAt                                  @title: '{i18n>replicated.createdAt}';
    modifiedAt                                 @title: '{i18n>replicated.modifiedAt}';
};

annotate db.Vehicles with @Common.SemanticKey: [ID];

annotate db.Vehicles with @UI: {
    HeaderInfo                        : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : '{i18n>Vehicle}',
        TypeNamePlural: '{i18n>Vehicles}',
        Title         : {
            $Type: 'UI.DataField',
            Value: erpID
        },
        // Description   : {
        //     $Type : 'UI.DataFieldForAnnotation',
        //     Target: '@UI.ConnectedFields#HeaderDescription'
        // }
    },
    
    ConnectedFields #HeaderDescription: {
        $Type   : 'UI.ConnectedFieldsType',
        Template: '{salesOrganisation} / {distributionChannel} / {organizationDivision}',
        Data    : {
            $Type           : 'Core.Dictionary',
            salesOrganisation    : {
                $Type: 'UI.DataField',
                Value: salesOrganisation
            },
            distributionChannel   : {
                $Type: 'UI.DataField',
                Value: distributionChannel
            },
            organizationDivision: {
                $Type: 'UI.DataField',
                Value: organizationDivision
            }
        }
    }
};
