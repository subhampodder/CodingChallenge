@isTest
public class barcodeActionLwcControllertest{
    
    @istest
    public static void  getFieldstest(){
        Account acc = new Account(name='Test Account');
        insert acc;
        barcodeActionLwcController.getFields(acc.id,'name');
        barcodeActionLwcController.saveTheFile(acc.id,'codeval','code39','name');
    }

}