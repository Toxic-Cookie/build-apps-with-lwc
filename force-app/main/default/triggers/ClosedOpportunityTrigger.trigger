trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasks = new list<Task>();
    for (Opportunity o : Trigger.new) {
        if (o.StageName == 'Closed Won') {
            Task task = new Task();
            task.Subject = 'Follow Up Test Task';
            task.WhatId = o.Id;
            tasks.add(task);
        }
    }
    if (tasks.size() > 0) {
        insert tasks;
    }
}