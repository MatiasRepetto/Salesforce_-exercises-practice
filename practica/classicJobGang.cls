public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer cant, String name){
        List<Contact> listContact = new List<Contact>();
        for(integer i=1; i<cant+1; i++){
            Contact aux = new Contact();
            aux.FirstName = 'Test ' + i;
            aux.LastName = name;
            listContact.add(aux);
        }
        return listContact;
    }
}