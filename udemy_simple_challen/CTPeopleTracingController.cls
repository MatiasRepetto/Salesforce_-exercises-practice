public with sharing class CTPeopleTracingController {
    
    public static list<People_Tracing__c> getTraces(String recordId){
        list<People_Tracing__c> auxList = [SELECT Contact_Date__c, Contact_Type__c, CreatedById, LastModifiedById, Name, OwnerId, Person_1__c, Person_2__c
                                            FROM People_Tracing__c WHERE Id = :recordId ORDER BY Contact_Date__c DESC];
        return auxList;
    }

    public static list<People_Tracing__c> checkDuplicates(list<People_Tracing__c> peopleTraces){
        Set<Id> auxSet = new Set<Id>();
        for(People_Tracing__c ppl : peopleTraces){
            auxSet.add(ppl.Id);
        }
        list<People_Tracing__c> auxList = [SELECT Contact_Date__c, Contact_Type__c, CreatedById, LastModifiedById, Name, OwnerId, Person_1__c, Person_2__c
                                            FROM People_Tracing__c WHERE Id IN :auxSet];
        return auxList;
    }
}
