public class AccountProcessor {
	@future
    public static void countContacts(List<Id> listofId){
        List<Account> accountListUpdate = new List<Account>();
        list<Account> accounts = [SELECT Id, Name, (Select Id from Contacts) FROM Account WHERE Id IN :listofId];
        for(Account t : accounts){
            list<Contact> auxcontactlist = t.Contacts;
            t.Number_of_Contacts__c = auxcontactlist.size();
            accountListUpdate.add(t);
        }
        update accountListUpdate;
    }
}