trigger taskTrigger on Task (after update) {
	if(Trigger.isAfter && Trigger.isUpdate)
        TaskTriggerHandler.updateTask(Trigger.new, Trigger.oldMap);
}