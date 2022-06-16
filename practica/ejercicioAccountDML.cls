public class AccountHandler {
    public static Account insertNewAccount(String nombre){
        try{
            Account newAccount = new Account();
			newAccount.Name = nombre;
            insert newAccount;
            system.debug('Ingreso correcto');
            return newAccount;
        }catch(DmlException e){
            system.debug('Error en DML: ' + e.getMessage());
            return null;
        }
    }
}