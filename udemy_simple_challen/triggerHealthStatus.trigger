trigger triggerHealthStatus on Person__c (after update) {
    switch on trigger.operationtype{
        when AFTER_UPDATE{
            triggerHealthHandler.afterUpdateHealthHandler(trigger.new);
        }
    }
}