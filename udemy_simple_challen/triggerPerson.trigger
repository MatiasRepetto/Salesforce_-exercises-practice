trigger triggerPerson on Person__c (after insert, before insert, before update) {
    switch on trigger.operationType{
        when AFTER_INSERT{
            triggerPersonHandler.afterInsertHandler(Trigger.new);
        }
        
        when BEFORE_INSERT{
            triggerPersonHandler.beforeInsertHandler(Trigger.new);
        }
        
        when BEFORE_UPDATE{
            triggerPersonHandler.beforeUpdateHandler(Trigger.new);
        }
    }
}