list<Account> newlistAcc = new list<Account>();
Account newAcc = new Account();
newAcc.Name = 'WingNut Films';
newAcc.Rating = 'Warm';
newlistAcc.add(newAcc);
list<opportunity> newlistOpp = new list<Opportunity>();
Opportunity newOpp = new Opportunity();
newOpp.Name = 'Lord Of The Rings';
newOpp.StageName = 'Qualification';
newOpp.CloseDate = System.today();
insert newlistAcc;
Account aux = [SELECT Id FROM Account WHERE Name = 'WingNut Films'];
newOpp.AccountId = aux.Id;
newlistOpp.add(newOpp);
insert newlistOpp;
for(Account a : newlistAcc){
    a.Name = 'New Line Cinema';
}
for(Opportunity o : newlistOpp){
    o.StageName = 'Closed-Won';
}
update newlistAcc;
update newlistOpp;
delete newlistOpp;
list<Opportunity> newLstDelOpp = [SELECT Name FROM Opportunity WHERE isDeleted = true ALL ROWS];
undelete newLstDelOpp;
