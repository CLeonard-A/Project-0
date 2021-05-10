@isTest
private class PossibleChannelTriggerHandler_Test {
    
    @testSetup
    private static void pcthTestDataFactory(){
        //create and insert Channels and Possible Channels
        Integer testDataCount = 10;	//Should NOT be less than 2
        List<Channel__c> channelList = new List<Channel__c>();
        List<Possible_Channel__c> possibleChannelList = new List<Possible_Channel__c>();
        for(Integer i=0 ; i<testDataCount ; i++){
            Channel__c newChannel = new Channel__c(Name='Channel '+i, Channel_Description__c='Channel '+i+' is a great channel.');
            channelList.add(newChannel);
            
            Possible_Channel__c newPossibleChannel = new Possible_Channel__c(Name='Possible Channel '+i, Possible_Channel_Description__c='Possible Channel '+i+' could be a great channel.');
            possibleChannelList.add(newPossibleChannel);
        }
        Possible_Channel__c newPossibleChannel = new Possible_Channel__c(Name='Super New Possible Channel', Possible_Channel_Description__c='a');
        insert newPossibleChannel;
        insert channelList;
        insert possibleChannelList;
    }
    
    @isTest
    private static void pcthPositiveTest(){
        //single positive insert data test
        Possible_Channel__c newPossChannel1 = new Possible_Channel__c(Name='New Possible Channel', Possible_Channel_Description__c='New Possible Channel is a great possible channel.');
        try {
        	insert newPossChannel1;
        } catch (exception e){
            System.debug(e.getMessage());
        }
        
        //single positive update data test
        List<Possible_Channel__c> PossChannels = [SELECT Name, Possible_Channel_Description__c FROM Possible_Channel__c];
        
        //Update Name
        PossChannels[0].Name = 'Newest Possible Channel';
        try {
            update PossChannels[0];
        } catch (exception e) {
            System.debug(e.getMessage());
        }
        //Update Description
        PossChannels[1].Possible_Channel_Description__c = 'This possible channel is a great possible channel.';
        try {
            update PossChannels[1];
        } catch (exception e) {
            System.debug(e.getMessage());
        }
        
        
    }
    
    @isTest
    private static void pcthBulkTest(){
        Integer bulkTestCount = 10;
        //bulk positive insert data test
        List<Possible_Channel__c> newPossChannelList = new List<Possible_Channel__c>();
        for(Integer i=0 ; i<bulkTestCount ; i++){
            Possible_Channel__c newPossChannel = new Possible_Channel__c(Name='New Possible Channel '+i, Possible_Channel_Description__c='New Possible Channel '+i+'is a great possible channel.');
            newPossChannelList.add(newPossChannel);
        }
        try {
        	insert newPossChannelList;
        } catch (exception e){
            System.debug(e.getMessage());
        }
        
        //bulk positive update data test
        //Update Name
        for(Integer i=0 ; i<bulkTestCount ; i++){
            Possible_Channel__c newPossChannel = new Possible_Channel__c(Name='Newest Possible Channel '+i, Possible_Channel_Description__c='New Possible Channel '+i+'is a great possible channel.');
            newPossChannelList[i].Name = newPossChannel.Name;
            newPossChannelList[i].Possible_Channel_Description__c = newPossChannel.Possible_Channel_Description__c;
        }
        try {
        	update newPossChannelList;
        } catch (exception e){
            System.debug(e.getMessage());
        }
        //Update Description
        for(Integer i=0 ; i<bulkTestCount ; i++){
            Possible_Channel__c newPossChannel = new Possible_Channel__c(Name='Newest Possible Channel '+i, Possible_Channel_Description__c='Newest Possible Channel '+i+'is a great possible channel.');
            newPossChannelList[i].Name = newPossChannel.Name;
            newPossChannelList[i].Possible_Channel_Description__c = newPossChannel.Possible_Channel_Description__c;
        }
        try {
        	update newPossChannelList;
        } catch (exception e){
            System.debug(e.getMessage());
        }
    }
    
    @isTest
    private static void pcthNegativeTest(){
        //negative insert data test
        
        //Repeat with Possible Channels
        Possible_Channel__c newPossChannel1 = new Possible_Channel__c(Name='Possible Channel 1', Possible_Channel_Description__c='Possible Channel 1 could be a great channel.');
        try {
        	insert newPossChannel1; //Repeat name and description with Possible Channel
        } catch (exception e){
            System.debug(e.getMessage());
        }
        Possible_Channel__c newPossChannel2 = new Possible_Channel__c(Name='Possible Channel 2', Possible_Channel_Description__c='New Possible Channel is a great possible channel.');
        try {
        	insert newPossChannel2; //Repeat name and description with Possible Channel
        } catch (exception e){
            System.debug(e.getMessage());
        }
        Possible_Channel__c newPossChannel3 = new Possible_Channel__c(Name='New Possible Channel', Possible_Channel_Description__c='Possible Channel 3 could be a great channel.');
        try {
        	insert newPossChannel3; //Repeat name and description with Possible Channel
        } catch (exception e){
            System.debug(e.getMessage());
        }
        
        //Repeat with Channels
        Possible_Channel__c newPossChannel4 = new Possible_Channel__c(Name='Channel 1', Possible_Channel_Description__c='Channel 1 is a great channel.');
        try {
        	insert newPossChannel4; //Repeat name and description with Possible Channel
        } catch (exception e){
            System.debug(e.getMessage());
        }
        Possible_Channel__c newPossChannel5 = new Possible_Channel__c(Name='Channel 1', Possible_Channel_Description__c='New Possible Channel is a great possible channel.');
        try {
        	insert newPossChannel5; //Repeat name with Possible Channel
        } catch (exception e){
            System.debug(e.getMessage());
        }
        Possible_Channel__c newPossChannel6 = new Possible_Channel__c(Name='New Possible Channel', Possible_Channel_Description__c='Channel 3 is a great channel.');
        try {
        	insert newPossChannel6; //Repeat description with Possible Channel
        } catch (exception e){
            System.debug(e.getMessage());
        }
        
        //negative update data test
        List<Possible_Channel__c> PossChannels = [SELECT Name, Possible_Channel_Description__c FROM Possible_Channel__c];
        
        //Repeat Channel Name
        PossChannels[0].Name = 'Channel 1';
        try {
            update PossChannels[0];
        } catch (exception e) {
            System.debug(e.getMessage());
        }
        //Repeat Channel Description
        PossChannels[1].Possible_Channel_Description__c = 'Channel 1 is a great channel.';
        try {
            update PossChannels[1];
        } catch (exception e) {
            System.debug(e.getMessage());
        }
        //Repeat Possible Channel Name
        PossChannels[0].Name = 'Possible Channel 1';
        try {
            update PossChannels[0];
        } catch (exception e) {
            System.debug(e.getMessage());
        }
        //Repeat Possible Channel Description
        //PossChannels[1].Possible_Channel_Description__c = 'Possible Channel 1 could be a great channel.';
        PossChannels[1].Possible_Channel_Description__c = 'a';
        try {
            update PossChannels[1];
        } catch (exception e) {
            System.debug(e.getMessage());
        }
        
    }
}