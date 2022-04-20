public class CustomerService {

    public Account objA {get;set;}
    public String status {get;set;}
    
    public CustomerService()
    {
       objA = new Account();
       status = '';
    }

    public PageReference doSave() {
        //establish connection
        partnerSoapSforceCom.Soap myPartnerSoap = new partnerSoapSforceCom.Soap();
        partnerSoapSforceCom.LoginResult partnerLoginResult= myPartnerSoap.login('cricket-leagues@cl.com','1qaz!QAZgrBIPldIUzKgzYyoV5GZthVT');
        
        system.debug('login_________________>'+partnerLoginResult);
        system.debug('sid_________________>'+partnerLoginResult.sessionId);
        
        String session_id = partnerLoginResult.sessionId;
       
        soapSforceComSchemasClassAccountser.SessionHeader_element sh = new soapSforceComSchemasClassAccountser.SessionHeader_element();
        sh.sessionId = session_id;
        
        soapSforceComSchemasClassAccountser.AccountService a1 = new soapSforceComSchemasClassAccountser.AccountService();
        a1.SessionHeader = sh;
        String status = a1.createCustomer(objA.Name,objA.phone,objA.billingcity);
        
        if(status == 'success')
        {
            insert objA;
        }
        
        if(objA.id != null)
        {
            status = 'Contact has been Created Successfully';
        }
         system.debug('------>'+status);
         
        PageReference pageRef = ApexPages.currentPage();

        return pageRef.setRedirect(false);
         //objA = null;
        // return null;   
    }
}