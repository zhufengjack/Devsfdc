trigger LeadConvertTrigger on Lead (before update) {
	List<Opportunity> ConvertedOpportunityList=new List<Opportunity>();
	for(Lead lead:trigger.new)
	{
		if(lead.IsConverted==true)
		{
			Opportunity opp=new Opportunity(id=lead.ConvertedOpportunityId);
			opp.School__c=lead.School__c;
			System.debug('Opp.School__c:'+opp.School__c);
			ConvertedOpportunityList.add(opp);
		}
	}
	update ConvertedOpportunityList;

}