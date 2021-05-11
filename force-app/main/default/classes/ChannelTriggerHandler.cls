public class ChannelTriggerHandler {
    public static void checkChannelInsert(List<Channel__c> inList){
        
        List<Possible_Channel__c> possChannels = [SELECT Name, Possible_Channel_Description__c, Approval__c FROM Possible_Channel__c];
        
        for (Channel__c newChannel : inList){
            Boolean check = false;
            for (Possible_Channel__c possChannelCheck : possChannels){
                if(newChannel.Name == possChannelCheck.Name && newChannel.Channel_Description__c == possChannelCheck.Possible_Channel_Description__c){
                    if(possChannelCheck.Approval__c == 'Approved'){
                        check = true;
                        break;
                    }
                }
            }
            if (check == false){
                newChannel.addError('Channel does not have an Approved corresponding Possible Channel.');
            }
        }
    }
}