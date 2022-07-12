public with sharing class triggerContactHandler {
    public static void handlerAfterInsert(list<Contact> contactAux){   
        AggregateResult[] auxRes = [SELECT AccountId, COUNT(Id) FROM Contact WHERE Active__c = true GROUP BY AccountId];
        list<Account> newAcc = new list<Account>();
        for(AggregateResult agg : auxRes){
            for(Contact cont : contactAux){
                if((cont.Active__c == true && String.valueOf(agg.get('AccountId')) == String.valueOf(cont.AccountId)) && String.isNotBlank(String.valueOf(cont.AccountId))){
                    Account auxAcc = new Account();
                    auxAcc.Id = cont.AccountId;
                    auxAcc.Active_Contacts__c = Integer.valueOf(agg.get('expr0'));
                    newAcc.add(auxAcc);
                }
            }
        }
        if(newAcc.size() > 0){
            update newAcc;
        }
    }

    public static void handlerAfterUpdate(list<Contact> contactAux){
        AggregateResult[] auxRes = [SELECT AccountId, COUNT(Id) FROM Contact WHERE Active__c = true GROUP BY AccountId];
        list<Account> newAcc = new list<Account>();
        for(AggregateResult agg : auxRes){
            for(Contact cont : contactAux){
                if((cont.Active__c == true && String.valueOf(agg.get('AccountId')) == String.valueOf(cont.AccountId)) && String.isNotBlank(String.valueOf(cont.AccountId))){
                    Account auxAcc = new Account();
                    auxAcc.Id = cont.AccountId;
                    auxAcc.Active_Contacts__c = Integer.valueOf(agg.get('expr0'));
                    newAcc.add(auxAcc);
                }else if((cont.Active__c == false && String.valueOf(agg.get('AccountId')) == String.valueOf(cont.AccountId)) && String.isNotBlank(String.valueOf(cont.AccountId))){
                    Account auxAcc = new Account();
                    auxAcc.Id = cont.AccountId;
                    auxAcc.Active_Contacts__c = Integer.valueOf(agg.get('expr0')) - 1;
                    newAcc.add(auxAcc);
                }else{
                    continue;
                }
            }
        }
        if(newAcc.size() > 0){
            update newAcc;
        }
    }

    public static void handlerAfterDelete(list<Contact> contactAux){
        AggregateResult[] auxRes = [SELECT AccountId, COUNT(Id) FROM Contact WHERE Active__c = true GROUP BY AccountId];
        list<Account> newAcc = new list<Account>();
        for(AggregateResult agg : auxRes){
            for(Contact cont : contactAux){
                if(String.valueOf(agg.get('AccountId')) == String.valueOf(cont.AccountId)){
                    Account auxAcc = new Account();
                    auxAcc.Id = cont.AccountId;
                    auxAcc.Active_Contacts__c = Integer.valueOf(agg.get('expr0'));
                    newAcc.add(auxAcc);
                }
            }
        }
        if(newAcc.size() > 0){
            update newAcc;
        }
    }
}
