public with sharing class CTTRLocationTracingController {
    
    public static list<Location_Tracing__c> getVisitors(String locationId){
        list<Location_Tracing__c> auxList = [SELECT CreatedById, LastModifiedById, Location__c, Name, Person__c, Visit_Date__c 
                                            FROM Location_Tracing__c WHERE Id = :locationId ORDER BY Visit_Date__c DESC];
        return auxList;
    }

    public static list<Location_Tracing__c> getLocationsByPersonIds(Set<Id> personIds){
        list<Location_Tracing__c> auxList = [SELECT CreatedById, LastModifiedById, Location__c, Name, Person__c, Visit_Date__c 
                                            FROM Location_Tracing__c 
                                            WHERE Person__c IN :personIds AND Visit_Date__c = LAST_N_DAYS:10];
        return auxList;
    }

    public static list<Location_Tracing__c> getLocationsByLocationIds(Set<Id> locationIds){
        list<Location_Tracing__c> auxList = [SELECT CreatedById, LastModifiedById, Location__c, Name, Person__c, Visit_Date__c 
                                            FROM Location_Tracing__c 
                                            WHERE Location__c IN :locationIds AND Person__r.Health_Status__c = 'Green' AND Visit_Date__c = LAST_N_DAYS:10];
        return auxList;
    }

    public static list<Location_Tracing__c> checkDuplicates(List<Location_Tracing__c> locationTraces){
        Set<Id> auxSet = new set<Id>();
        for(Location_Tracing__c loc : locationTraces){
            auxSet.add(loc.Id);
        }
        list<Location_Tracing__c> auxListLoc = [SELECT CreatedById, LastModifiedById, Location__c, Name, Person__c, Visit_Date__c 
                                                FROM Location_Tracing__c 
                                                WHERE Location__c IN :auxSet];
        return auxListLoc;
    }
}
