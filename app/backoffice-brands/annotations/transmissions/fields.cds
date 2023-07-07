using AppBackofficeBrandsService as service from '../../../../srv';

annotate service.Transmissions with {
    driveType @UI.Hidden;
    type      @Ui.Hidden;
};
