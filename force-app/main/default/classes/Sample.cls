public class Sample {
    public List<VAT_Data__mdt> listEmpSettings {get;set;}
    public Sample() {
        listEmpSettings = [SELECT Test_Field_Label__c FROM VAT_Data__mdt where Country_Name__c = 'TATA'];
    }
}