public with sharing class bulkUpdate {
    public static void modificarBulk(){
        list<Opportunity> newListOpp = [SELECT Name, Amount, Profile__c FROM Opportunity];
        for(Opportunity o : newListOpp){
            if(o.Amount >= 50000){
                o.Profile__c = 'High';
            }else if(o.Amount > 10000 && o.Amount < 50000){
                o.Profile__c = 'Medium';
            }else{
                o.Profile__c = 'Low';
            }
        }
        update newListOpp;
    }
}