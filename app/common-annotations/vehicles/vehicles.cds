using {retail.dwb as db} from '../../../db';

annotate db.Vehicles with {
    ID                                         @title: '{i18n>General.ID}';
    erpID                                      @title: '{i18n>Vehicles.erpID}';
    salesOrganisation                          @title: '{i18n>Vehicles.salesOrganisation}';
    distributionChannel                        @title: '{i18n>Vehicles.distributionChannel}';
    organizationDivision                       @title: '{i18n>Vehicles.organizationDivision}';
    material                                   @title: '{i18n>Vehicles.material}';
    plant                                      @title: '{i18n>Vehicles.plant}';
    salesPartner                               @title: '{i18n>SalesPartner}';
    dealerPartner                              @title: '{i18n>Vehicles.dealerPartner}';
    soldToPartner                              @title: '{i18n>SoldToPartner}';
    shipToPartner                              @title: '{i18n>ShipToPartner}';
    billToPartner                              @title: '{i18n>BillToPartner}';
    paidByPartner                              @title: '{i18n>PaidByPartner}';
    brand                                      @title: '{i18n>Brand}';
    salesType                                  @title: '{i18n>SalesType}';
    model                                      @title: '{i18n>Model}';
    usage                                      @title: '{i18n>VehicleUsage}';
    customerState                              @title: '{i18n>CustomerState}';
    endCustomerState                           @title: '{i18n>EndCustomerState}';
    availability                               @title: '{i18n>VehicleAvailability}';
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
};

annotate db.Vehicles with @Common.SemanticKey: [ID];

annotate db.Vehicles with @UI: {
    HeaderInfo                        : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : '{i18n>Vehicle}',
        TypeNamePlural: '{i18n>Vehicles}',
        Title         : {
            $Type: 'UI.DataField',
            Value: ID
        }
    }
};
