public class AccountUtility {
    public static void viewAnnualRevenue(){
        List<Account> accountsList = [SELECT Name, AnnualRevenue FROM Account];
        for(Account t : accountsList){
            String acctRev = t.Name + ' : ' + t.AnnualRevenue;
            system.debug(acctRev);
        }
    }
}