public with sharing class triggerLocationHandler {
    
    public static void beforeInsertLocationHandler(list<Location__c> auxInserted){
        for(Location__c loc : auxInserted){
            loc.Status__c = 'Green';
        }
    }

    public static void afterUpdateLocationHandler(list<Location__c> auxUpdated){
        list<Location__c> auxLocMod = new list<Location__c>();
        for(Location__c loc : auxUpdated){
            Location__c flagLoc = new Location__c();
            flagLoc.Id = loc.Id;
            flagLoc.Status_Update_Date__c = System.today();
            auxLocMod.add(flagLoc);
        }
        update auxLocMod;
    }

}
