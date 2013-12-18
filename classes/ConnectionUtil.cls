/**
*@Date/Time: 12:00AM 18 Dec 2013
*@Auther:Jack Zhu
*/


public class ConnectionUtil {
	public static EtownService.BasicHttpBinding_ISalesForceService loginOboe()
	{
		EtownService.BasicHttpBinding_ISalesForceService stub=new EtownService.BasicHttpBinding_ISalesForceService();
		stub.timeout_x=120*1000;
		EtownServiceToken.UsernameToken_element token=new EtownServiceToken.UsernameToken_element();
		token.Username='SalesforceSmartUser';
		token.Password='SalesforceSmartPwd';
		EtownServiceToken.Security_element security=new EtownServiceToken.Security_element();
		security.UsernameToken=token;
		stub.Security=security;
		
		/**
		*Login to different system based on custom setting, no need to change url always.We will build 4 endpoints for same service. 
		*And system login to different system based which one is active.
		*
		*/
		
		try{
		ExternalServer__c endpoint=ExternalServer__c.getInstance('OboeServer'); 
		if(endpoint.Active__c==true)
		{
			stub.endpoint_x=endpoint.EndPoint__c;
		}else
			{
				endpoint=ExternalServer__c.getInstance('OboeServerStaging'); 
				if(endpoint.Active__c==true)
				{
					stub.endpoint_x=endpoint.EndPoint__c;
				}else
					{
						endpoint=ExternalServer__c.getInstance('OboeServerQA');
						if(endpoint.Active__c==true)
						{
						stub.endpoint_x=endpoint.EndPoint__c;
						}else
							{
								endpoint=ExternalServer__c.getInstance('OboeServerDev');
								stub.endpoint_x=endpoint.EndPoint__c;
							}
					}
		
		
		}
		}catch(Exception e)
		{
			System.debug('Login Oboe Service Failed:'+ e.getMessage());
		}
		
		return stub;
		
	}

}