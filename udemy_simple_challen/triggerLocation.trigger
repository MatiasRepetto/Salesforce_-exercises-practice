trigger triggerLocation on Location__c (before insert, after update) {
    switch on trigger.operationtype{
        
        when BEFORE_INSERT{
            triggerLocationHandler.beforeInsertLocationHandler(trigger.new);
        }

        when AFTER_UPDATE{  
            if(!checkRecursive.firstcall){
                checkRecursive.firstcall = true;
                triggerLocationHandler.afterUpdateLocationHandler(trigger.new);
            }
        }
    }
}