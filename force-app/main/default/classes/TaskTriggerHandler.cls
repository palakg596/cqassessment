public with sharing class TaskTriggerHandler {
    public static void updateTask(List<Task> newList, Map<Id,Task> oldMap)
    {
        Set<Id> accId = new Set<Id>();
        for(Task t : newList)
        {
            if(t.Status == 'Completed' && oldMap.get(t.Id).Status != 'Completed' && t.AccountId != null)
                accId.add(t.AccountId);
        }
        
        if(!accId.isEmpty()) {
            List<Account> accList = [SELECT Id, Description FROM Account WHERE Id IN :accId WITH SECURITY_ENFORCED];            
            for (Account a : accList) {
                for (Task t : newList) {
                    if (t.AccountId == a.Id && t.Status == 'Completed') {
                        a.Active__c = True;
                        a.Description = t.Description;
                        
                    }
                }
            }
            update accList;
        }
        
    }
}