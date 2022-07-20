public with sharing class DailyLeadProcessor implements Schedulable{
    public
        void execute(SchedulableContext sc){
            list<Lead> auxLstLead = [SELECT Id FROM Lead WHERE Lead.LeadSource = '' LIMIT 200]; 
            for(Lead l : auxLstLead){
                l.LeadSource = 'Dreamforce';
            }
            update auxLstLead;
        }
}
