using {retail.dwb as db} from '../../../db';

@requires: 'authenticated-user'
service ReplicationMasterdataTestService {

    function testModel(id : db.Model:id)                                                   returns String;
    function testStaticModel()                                                             returns String;
    function testColor(id : db.Color:id)                                                   returns String;
    function testStaticColor()                                                             returns String;
    function testEngine(id : db.Engine:id)                                                 returns String;
    function testStaticEngine()                                                            returns String;
    function testBrandCharacteristic(brand : db.Brand:code, type : db.Characteristic:code) returns String;
    function testStaticBrandCharacteristic()                                               returns String;
    function testTransmission(id : db.Transmission:id)                                     returns String;
    function testStaticTransmission()                                                      returns String;
    function testSalesType(brand : db.Brand:code, id : db.SalesType:id)                    returns String;
    function testStaticSalesType()                                                         returns String;
    function testBodyType(brand : db.Brand:code, id : db.BodyType:id)                      returns String;
    function testStaticBodyType()                                                          returns String;
    function testModelSeries(brand : db.Brand:code, id : db.ModelSeries:id)                returns String;
    function testStaticModelSeries()                                                       returns String;
    function testEquipment(id : db.Equipment:id)                                           returns String;
    function testStaticEquipment()                                                         returns String;
    function testEquipmentChapter(brand : db.Brand:code, id : db.EquipmentChapter:id)      returns String;
    function testStaticEquipmentChapter()                                                  returns String;
    function testEquipmentCategory(brand : db.Brand:code, id : db.EquipmentCategory:id)    returns String;
    function testStaticEquipmentCategory()                                                 returns String;
    function testDriveType(brand : db.Brand:code, id : db.DriveType:id)                    returns String;
    function testStaticDriveType()                                                         returns String;
    function testTransmissionType(brand : db.Brand:code, id : db.TransmissionType:id)      returns String;
    function testStaticTransmissionType()                                                  returns String;
    function testFuelType(brand : db.Brand:code, id : db.FuelType:id)                      returns String;
    function testStaticFuelType()                                                          returns String;
}
