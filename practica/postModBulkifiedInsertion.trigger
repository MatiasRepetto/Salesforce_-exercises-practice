trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> auxList = new List<Task>();
    for(Opportunity o : Trigger.New){
        if(o.StageName == 'Closed Won'){
            Task aux = new Task();
            aux.Subject = 'Follow Up Test Task';
            aux.WhatId = o.AccountId;
            auxList.add(aux);
        }
    }
    insert auxList;
}