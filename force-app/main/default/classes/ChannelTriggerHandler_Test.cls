@isTest
public class ChannelTriggerHandler_Test {

    @testSetup
    private static void cthTestDataFactory(){
        //create and insert Channels and Possible Channels
        Integer testDataChannelCount = 10;
        Integer testDataPossChannelCount = 10;
        List<Channel__c> channelList = new List<Channel__c>();
        List<Possible_Channel__c> possibleChannelList = new List<Possible_Channel__c>();
        for(Integer i=0 ; i<testDataPossChannelCount ; i++){
            Possible_Channel__c newPossibleChannel = new Possible_Channel__c(Name='Possible Channel '+i, Possible_Channel_Description__c='Possible Channel '+i+' could be a great channel.');
            possibleChannelList.add(newPossibleChannel);
        }
        for(Integer i=0 ; i<2*testDataChannelCount ; i++){
            Possible_Channel__c newPossChannel = new Possible_Channel__c(Name='Channel '+i, Possible_Channel_Description__c='Channel '+i+' is a great channel.', Approval__c='Approved');
            possibleChannelList.add(newPossChannel);
        }
        for(Integer i=0 ; i<testDataChannelCount ; i++){
            Channel__c newChannel = new Channel__c(Name='Channel '+i, Channel_Description__c='Channel '+i+' is a great channel.');
            channelList.add(newChannel);
        }
        Possible_Channel__c newPossibleChannel = new Possible_Channel__c(Name='Great Channel Name', Possible_Channel_Description__c='Good Channel Description.', Approval__c='Approved');
        Possible_Channel__c newPossibleChannel2 = new Possible_Channel__c(Name='Not so Great Channel Name', Possible_Channel_Description__c='Bad Channel Description.');
        insert possibleChannelList;
        insert newPossibleChannel;
        insert newPossibleChannel2;
        insert channelList;
    }
    
    @isTest
    private static void cthPositiveTest(){
        Channel__c newChannel = new Channel__c(Name='Great Channel Name', Channel_Description__c='Good Channel Description.');
        try {
            insert newChannel;
        } catch (exception e) {
            System.debug(e.getMessage());
        }
    }
    
    @isTest
    private static void cthBulkTest(){
        Integer newChannelCount = 10;	//Should match the variable testDataChannelCount on line 7
        List<Channel__c> newChannelList = new List<Channel__c>();
        for(Integer i=0 ; i<newChannelCount ; i++){
            Integer j = i + newChannelCount;
            Channel__c newChannel = new Channel__c(Name='Channel '+j, Channel_Description__c='Channel '+j+' is a great channel.');
            newChannelList.add(newChannel);
        }
        try {
            insert newChannelList;
        } catch (exception e) {
            System.debug(e.getMessage());
        }
    }
    
    @isTest
    private static void cthNegativeTest(){
        //Channel without corresponding Possible Channel
        Channel__c newChannel1 = new Channel__c(Name='Unique name', Channel_Description__c='Unique description.');
        try {
            insert newChannel1;
        } catch (exception e) {
            System.debug(e.getMessage());
        }
        //Channel with corresponding Possible Channel without Approved
        Channel__c newChannel2 = new Channel__c(Name='Not so Great Channel Name', Channel_Description__c='Bad Channel Description.');
        try {
            insert newChannel2;
        } catch (exception e) {
            System.debug(e.getMessage());
        }
    }
}