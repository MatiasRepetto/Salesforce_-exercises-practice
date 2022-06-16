public class LeadProcessor implements
    Database.Batchable<sObject>, Database.Stateful {
    public Integer recordsProcessed = 0;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
    }
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> Leads = new List<Lead>();
        for (Lead led : scope) {
            led.LeadSource = 'Dreamforce';
            Leads.add(led);
            recordsProcessed = recordsProcessed + 1;
        }
        update Leads;
    }
    public void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' Records procesados');
    }
}