using AppBackofficeBrandsService as service from '../../../../srv';

annotate service.SalesTypes with {
    brand       @UI.Hidden;
    modelSeries @UI.Hidden;
}
