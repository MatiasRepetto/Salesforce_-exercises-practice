public with sharing class triggerHealthHandler {
    public static void afterUpdateHealthHandler(list<Person__c> auxList){
        list<Person__c> auxRedPerson = new list<Person__c>();
        for(Person__c per : auxList){
            if(per.Health_Status__c == 'Red'){
                auxRedPerson.add(per);
            }
        }
        if(auxRedPerson.size() > 0){
            AggregateResult[] aggRes = [SELECT Location__r.Id, MAX(Location__r.Red_Score__c) FROM Location_Tracing__c WHERE Person__c IN :auxRedPerson AND Visit_Date__c = LAST_N_DAYS:10 GROUP BY Location__r.Id];
            list<Location__c> auxListLoc = new list<Location__c>();
            for(AggregateResult agr : aggRes){
                Location__c auxLoc = new Location__c();
                //Location__c cloneAux = (Location__c)agr.get('Location__c');
                auxLoc.Id = (Id)agr.get('Id');
                auxLoc.Status__c = 'Red';
                auxLoc.Red_Score__c = (Decimal)agr.get('expr0') + 1;
                auxListLoc.add(auxLoc);
            }
            update auxListLoc;
            AggregateResult[] aggCoa = [SELECT Person_1__c, Person_2__c FROM People_Tracing__c WHERE Person_1__c IN :auxRedPerson AND Contact_Type__c = 'Cohabitant' GROUP BY Person_1__c, Person_2__c];
            AggregateResult[] aggNei = [SELECT Person_1__c, Person_2__c FROM People_Tracing__c WHERE Person_1__c IN :auxRedPerson AND Contact_Type__c = 'Neighbour' GROUP BY Person_1__c, Person_2__c];
            list<Person__c> auxCoa = new list<Person__c>();
            list<Person__c> auxNei = new list<Person__c>();
            for(AggregateResult arn : aggNei){
                Person__c persArn = (Person__c)arn.get('Person_2__c');    
                if(persArn.Health_Status__c != 'Red'){
                    Person__c auxNeiP = new Person__c();    
                    auxNeiP.Id = persArn.Id;
                    auxNeiP.Health_Status__c = 'Yellow';
                    auxNei.add(auxNeiP);
                }
                if(auxNei.size() > 0){
                    update auxNei;
                }
            }
            for(AggregateResult arc : aggCoa){
                Person__c perForArc = (Person__c)arc.get('Person_2__c');    
                if(perForArc.Health_Status__c != 'Red' || perForArc.Health_Status__c != 'Orange'){
                    Person__c auxCoaP = new Person__c();
                    auxCoaP.Id = perForArc.Id;
                    auxCoaP.Health_Status__c = 'Orange';
                    auxCoa.add(auxCoaP);
                }
                if(auxCoa.size() > 0){
                    update auxCoa;
                }
            }
        }
    }
}
