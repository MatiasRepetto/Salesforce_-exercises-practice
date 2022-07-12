trigger triggerContact on Contact (after insert, after update, after delete) {
    switch on trigger.operationType{
        when AFTER_INSERT{
            triggerContactHandler.handlerAfterInsert(trigger.new);
        }

        when AFTER_UPDATE{
            triggerContactHandler.handlerAfterUpdate(trigger.new);
        }

        when AFTER_DELETE{
            if(trigger.isdelete){
                triggerContactHandler.handlerAfterDelete(trigger.old);
            }
        }
    }
}