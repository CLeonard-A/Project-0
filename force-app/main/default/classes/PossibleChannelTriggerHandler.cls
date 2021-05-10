public class PossibleChannelTriggerHandler {
    public static void checkNameAndDescription(List<Possible_Channel__c> inList){
        //Check name and description against existing Channels
        for(Channel__c checkChannel : [SELECT Name, Channel_Description__c FROM Channel__c]){
            for(Possible_Channel__c newPossibleChannel : inList) {
                if (newPossibleChannel.Name == checkChannel.Name){
                    newPossibleChannel.Name.addError('A Channel already has this name.');
                }
                if (newPossibleChannel.Possible_Channel_Description__c == checkChannel.Channel_Description__c){
                    newPossibleChannel.Possible_Channel_Description__c.addError('A Channel already has this description.');
                }
            }
        }
        //Check name and description against other Possible Channels
        for(Possible_Channel__c checkPossibleChannel : [SELECT Name, Possible_Channel_Description__c FROM Possible_Channel__c]){
            for(Possible_Channel__c newPossibleChannel : inList){
                if (newPossibleChannel.Name == checkPossibleChannel.Name && newPossibleChannel.Id != checkPossibleChannel.Id){
                    newPossibleChannel.Name.addError('A Possible Channel already has this name.');
                }
                if (newPossibleChannel.Possible_Channel_Description__c == checkPossibleChannel.Possible_Channel_Description__c && newPossibleChannel.Id != checkPossibleChannel.Id){
                    newPossibleChannel.Possible_Channel_Description__c.addError('A Possible Channel already has this description.');
                }
            }
        }
    }
}