public with sharing class accountController {
    public static void updateAvgCaseResolutionDays(list<Id> accountId){
        Integer totalDays = 0, totalCases = 0;
        Decimal resolutionDays;
        map<Id,decimal> resDaysList = new map<Id,decimal>();
        // retrive all the cases for this account
        // get resolution days for each account (ClosedDate - CreatedDate)
        for(Case caseObj : [SELECT Id, CreatedDate, ClosedDate, AccountId
                            FROM Case
                            WHERE IsClosed=true
                            AND AccountId IN :accountId]){
            // increase number of cases
            totalCases++;
            // get duration in days and add it to totalDays
            totalDays += caseObj.CreatedDate.date().daysBetween(caseObj.ClosedDate.date());
            resolutionDays = totalDays/totalCases;
            resDaysList.put(caseObj.AccountId,resolutionDays);
        }
        // update account object
        list<Account> accToUpdate = new list<Account>();
        for(Id acc : accountId){
            Account acco = new Account(Id=acc, Avg_Case_Resolution_Days__c = resDaysList.get(acc));
            accToUpdate.add(acco);
        }
        update accToUpdate;
    }
    
}
