public class practicaLuispart2 {
    public static integer CountactCount(ID accountid1){
        list<Contact> auxListCont = [SELECT Name FROM Contact WHERE AccountId = :accountid1];
        return auxListCont.size();
    }
    
    public static integer CaseCount(ID accountid1){
        list<Contact> auxListCont = [SELECT Id FROM Contact WHERE AccountId = :accountid1];
        set<ID> auxid = new set<ID>();
        for(Contact t : auxListCont){
            auxid.add(t.Id);
        }
        
        list<Case> auxCase1 = [SELECT Id FROM Case WHERE ContactId IN :auxid];
        list<Case> auxCase2 = [SELECT Id FROM Case WHERE AccountId = :accountid1];
        for(Case o : auxCase1){
     		if(!auxCase2.contains(o)){
          		auxCase2.add(o);
     		}
		}
        return auxCase2.size();
    }
    
    public static list<Case> OpenCases(ID accountid1){
        
        list<Contact> auxListCont = [SELECT Id FROM Contact WHERE AccountId = :accountid1];
        set<ID> auxid = new set<ID>();
        for(Contact t : auxListCont){
            auxid.add(t.Id);
        }
        
        list<Case> auxCase1 = [SELECT Id FROM Case WHERE ContactId IN :auxid AND Status != 'Closed'];
        list<Case> auxCase2 = [SELECT Id FROM Case WHERE AccountId = :accountid1 AND Status != 'Closed'];
        for(Case o : auxCase1){
     		if(!auxCase2.contains(o)){
          		auxCase2.add(o);
     		}
		}
        return auxCase2;
    }
    
    public static map<ID, list<Case>> AccountsWithOpenCases(){
        map<ID, list<Case>> AccWOC = new map<ID, list<Case>>();
        list<Account> accountss = [SELECT Id FROM Account];
        for(Account t : accountss){
            AccWOC.put(t.Id, practicaLuispart2.OpenCases(t.Id));
        }
        return AccWOC;
    }
}