public class LeadProcessor implements database.batchable<sObject>{
	
    public integer recordsProcessed = 0;
    
    public database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT FIELDS(ALL) FROM Lead');
    }
    
    public void execute(Database.BatchableContext bc, List<Lead> scopeList){
		list<Lead> auxList = new list<Lead>();
        for(Lead l : scopeList){
            l.LeadSource = 'Dreamforce';
            recordsProcessed = recordsProcessed + 1;
        }
        update auxList;
    }
    
    public void finish(Database.BatchableContext bc){
        system.debug('There are '+recordsProcessed+' record processed');
    }

}