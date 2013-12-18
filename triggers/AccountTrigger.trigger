trigger AccountTrigger on Account (after insert, before insert) {
	
	
	    if(trigger.isBefore)
    {
    	System.debug('************Account before');
    	
		    	
    }
        if(trigger.isAfter)
    {
    	System.debug('************Account After');
    	lead l =[select lastname from lead limit 1];
    	l.Title='test';
    	//update l;
		    	
    }

}