trigger accountTrigger on Account (before insert, after insert) {
    if(Trigger.isInsert){
        if(Trigger.isBefore)
            AccountTriggerHandler.checkActiveAccount(Trigger.new);
        if(Trigger.isAfter)
            AccountTriggerHandler.createRelatedTask(Trigger.new);       
    }
}