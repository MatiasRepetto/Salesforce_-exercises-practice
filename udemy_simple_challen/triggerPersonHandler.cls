public with sharing class triggerPersonHandler {
    public static void beforeInsertHandler(list<Person__c> triggerList){
        for(Person__c pers : triggerList){
            pers.Token__c = CTPersonController.getToken(pers.Mobile__c);
        }
    }
    
    public static void afterInsertHandler(list<Person__c> triggerList){
        list<Person__c> persToInsert = new list<Person__c>();
        for(Person__c pers : triggerList){
            Person__c aux = new Person__c();
            aux.Id = pers.Id;
            aux.Health_Status__c = 'Green';
            persToInsert.add(aux);
        }
        update persToInsert;
    }
    
    public static void beforeUpdateHandler(list<Person__c> beforeUpdateList){
        for(Person__c pers : beforeUpdateList){
			 pers.Status_Update_Date__c = System.Today();           
        }
    }
}
