@isTest
public class AccountProcessorTest {
	@isTest
    public static void testAccountNumeb(){
        Account aux = new Account();
        aux.Name = 'Tcs';
        insert aux;
        Contact contact1 = new Contact();
        Contact contact2 = new Contact();
        contact1.FirstName = 'Jhon';
        contact1.LastName = 'Five';
        contact1.AccountId = aux.Id;
        contact2.FirstName = 'Jhon';
        contact2.LastName = 'Six';
        contact2.AccountId = aux.Id;
        List<Id> listId = new List<Id>();
        listId.add(aux.Id);
        Test.startTest();
        AccountProcessor.countContacts(listId);
       	Test.stopTest();
    }
}