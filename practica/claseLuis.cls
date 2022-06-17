public class claseLuisPrac1 {
    public static Account CreateAccount(string nombre, boolean insertarA){
        Account newAccount = new Account();
        newAccount.Name = nombre;
        if(insertarA){
            insert newAccount;
        }
        return newAccount;
    }
    
    public static Contact CreateContact(boolean insertarC, ID accountid, string lastname){
        Contact newContact = new Contact();
        newContact.LastName = lastname;
        newContact.AccountId = accountid;
        if(insertarC){
            insert newContact;
        }
        return newContact;
    }
    
    public static list<Account> AccountBulk(boolean insertarAs, integer cantAcc, integer cantContac){
        list<Account> newAccounts = new list<Account>();
        list<Contact> newConts = new list<Contact>();
        for(integer i=0; i<cantAcc ; i++){
            Account auxAcc = claseLuisPrac1.CreateAccount('NewAcc Test'+i, false);
            newAccounts.add(auxAcc);
        }
        
        if(insertarAs){
            insert newAccounts;
        }
        for(Account t : newAccounts){
            for(integer j=0; j<cantContac; j++){
        		newConts.add(claseLuisPrac1.CreateContact(false, t.Id, 'LastName'+j));
        	}
        }
        insert newConts;
        return newAccounts;
    }
}