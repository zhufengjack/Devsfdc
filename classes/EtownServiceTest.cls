/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class EtownServiceTest {
     private static final String ServiceUsername = 'SFService';
       private static final String ServicePassword = '12@c03f@3t0wn';
        private static final String oboeUsername = 'SalesforceSmartUser';
    private static final String oboePassword = 'SalesforceSmartPwd';
    
    
    static testMethod void TestLoadStudents() {
        // TO DO: implement unit test
        
        EtownService.BasicHttpBinding_ISalesForceService stub=new EtownService.BasicHttpBinding_ISalesForceService();
        stub.timeout_x=120*1000;
        stub.endpoint_x='https://www.englishtown.com/Services/oboe2/1.0/SalesForceService.svc';
        EtownServiceToken.UsernameToken_element token=new EtownServiceToken.UsernameToken_element();
        token.Username='SalesforceSmartUser';
        token.Password='SalesforceSmartPwd';
        
        EtownServiceToken.Security_element security=new EtownServiceToken.Security_element();
        security.UsernameToken=token;
        
        stub.Security=security;
        
        
        EtownServiceDataContract.LoadStudentParamsV3 param=new EtownServiceDataContract.LoadStudentParamsV3();
        param.Username='jzhu8574';
        //param.NeededExtensionParts=1;
        param.RequireSyncReschedule=false;
        EtownServiceDataContract.LoadStudentResultV3 loadstudentresultv3= stub.LoadStudentV3(param);
        
        Boolean result=loadstudentresultv3.IsSuccess;
        EtownServiceDataContract.LoadStudent_MemberInfo memberInfo= loadstudentresultv3.MemberInfo;
        String email=memberInfo.Email;
        Integer memberid=memberInfo.Member_id;
        
        System.debug('Result:'+result+'email:'+email+'member id:'+memberid);
        /**
        EtownService.BasicHttpBinding_ISalesForceService stub=new EtownService.BasicHttpBinding_ISalesForceService();
        stub.timeout_x=120*1000;
        stub.endpoint_x='https://staging.englishtown.com/Services/oboe2/1.0/SalesForceService.svc';
        EtownServiceToken.UsernameToken_element token=new EtownServiceToken.UsernameToken_element();
        token.Username='SalesforceSmartUser';
        token.Password='SalesforceSmartPwd';
        
        EtownServiceToken.Security_element security=new EtownServiceToken.Security_element();
        security.UsernameToken=token;
        
        stub.Security=security;
        
        
        EtownServiceDataContract.LoadStudentParamsV3 param=new EtownServiceDataContract.LoadStudentParamsV3();
        param.Username='lef4';
        //param.NeededExtensionParts=1;
        param.RequireSyncReschedule=false;
        EtownServiceDataContract.LoadStudentResultV3 loadstudentresultv3= stub.LoadStudentV3(param);
        
        Boolean result=loadstudentresultv3.IsSuccess;
        EtownServiceDataContract.LoadStudent_MemberInfo memberInfo= loadstudentresultv3.MemberInfo;
        String email=memberInfo.Email;
        Integer memberid=memberInfo.Member_id;
        
        System.debug('Result:'+result+'email:'+email+'member id:'+memberid);
        */
        
        
    }
    
    static testMethod void TestPromoterLeads()
    {
    	
    }
}