public class TestMetadata {

    public TestMetadata(ApexPages.StandardController controller) {
        listEmpSettings = [SELECT Test_Field_Label__c FROM VAT_Data__mdt where Country_Name__c = 'TATA'];
        
        m1 = new Map<String, String>();
        for(VAT_Data__mdt objCS : [SELECT Id, Test_API_Name__c,Test_Field_Label__c FROM VAT_Data__mdt])
            m1.put(objCS.Test_API_Name__c, objCS.Test_Field_Label__c);
            
        Id conid = ApexPages.currentPage().getParameters().get('id');
        
        contactFieldsMap = new Map<String,String>();
        Contact conPrime =  [SELECT Phone,MobilePhone FROM Contact where id =: conid ];
    }
    
    public Map<String, String> m1  {get; set;}
    public Map<String, String> contactFieldsMap {get; set;}
    public List<VAT_Data__mdt> listEmpSettings {get;set;}
    public TestMetadata() {
        listEmpSettings = [SELECT Test_Field_Label__c FROM VAT_Data__mdt where Country_Name__c = 'TATA'];
    }
}