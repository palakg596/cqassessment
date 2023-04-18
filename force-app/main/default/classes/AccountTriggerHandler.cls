public class AccountTriggerHandler {
    public static void checkActiveAccount(List<Account> newList)
    {
        for(Account acc : newList)
        {
            if(acc.Active__c == True)
                acc.Active__c = False;
        }
    }
    
    public static void createRelatedTask(List<Account> newList)
    {
        List<Task> taskList = new List<Task>();
        for(Account acc : newList){
            Task t = new Task();
            t.Subject = 'Review Account - ' + acc.AccountNumber;
            t.ActivityDate = Date.ValueOf(acc.CreatedDate) + 7;
            t.OwnerId = acc.OwnerId;
            t.Status = 'Not Started';
            t.WhatId = acc.Id;
            taskList.add(t);
        }
        if(!taskList.isEmpty())
            insert taskList;
    }

}