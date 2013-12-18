trigger OpportunityBeforeTrigger on Opportunity (before insert, before update) {
	
	Map<String,Id> TerritoryMap=new Map<String,Id>();
	Set<String> TerritoryNameSet=new Set<String>();
	for(Opportunity opp: trigger.new)
	{
		if(opp.School__c!=' '&&opp.School__c!=null){
		TerritoryNameSet.add(opp.School__c.replace(' ','_'));
		System.debug('Opp.School__c'+opp.School__c);
		System.debug('Opp.School__c.replace'+opp.School__c.replace(' ','_'));
	
		}
		}
	List<Territory> TerritoryList=[Select Name,Id from Territory where name in:TerritoryNameSet];
	for(Territory ter:TerritoryList)
	{
		TerritoryMap.put(ter.name,ter.id);
		System.debug('ter.name:'+ter.name+'ter.id:'+ter.id);
	}
	for(Opportunity opp:trigger.new)
	{
		if(opp.School__c!=' '&&opp.School__c!=null){
		opp.TerritoryId=TerritoryMap.get(opp.School__c.replace(' ','_'));
		}
	}

}