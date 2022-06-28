public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static list<Contact> getContacts(){
        list<Contact> auxList = [SELECT FirstName, LastName, Email FROM Contact];
        return auxList;
    }
}
