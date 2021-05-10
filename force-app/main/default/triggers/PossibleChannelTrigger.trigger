trigger PossibleChannelTrigger on Possible_Channel__c (before insert, before update) {
    switch on trigger.operationType {
        when BEFORE_INSERT, BEFORE_UPDATE {
            PossibleChannelTriggerHandler.checkNameAndDescription(trigger.new);
        }
    }
}