trigger ChannelTrigger on Channel__c (before insert) {
    switch on trigger.operationType {
        when BEFORE_INSERT {
            ChannelTriggerHandler.checkChannelInsert(trigger.new);
        }
    }
}