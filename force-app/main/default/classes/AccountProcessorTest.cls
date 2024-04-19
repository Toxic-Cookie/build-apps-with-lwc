/*
Create an Apex class with a future method that accepts a List of Account IDs and updates a custom field on the Account object with the number of contacts associated to the Account. Write unit tests that achieve 100% code coverage for the class. Every hands-on challenge in this module asks you to create a test class.
Create a field on the Account object:
Label: Number Of Contacts
Name: Number_Of_Contacts
Type: Number
This field will hold the total number of Contacts for the Account
Create an Apex class:
Name: AccountProcessor
Method name: countContacts
The method must accept a List of Account IDs
The method must use the @future annotation
The method counts the number of Contact records associated to each Account ID passed to the method and updates the 'Number_Of_Contacts__c' field with this value
Create an Apex test class:
Name: AccountProcessorTest
The unit tests must cover all lines of code included in the AccountProcessor class, resulting in 100% code coverage.
Before verifying this challenge, run your test class at least once using the Developer Console Run All feature
*/

@isTest // Before verifying this challenge, run your test class at least once using the Developer Console Run All feature
public with sharing class AccountProcessorTest {
    @isTest
    public static void testNoOfContacts(){
        // These do not persist because of @isTest.
        // This whole method is thrown away after it executes.
        Account a = new Account();
        a.Name = 'Test Account';
        Insert a;
        
        Contact c = new Contact();
        c.FirstName = 'Bob';
        c.LastName =  'Willie';
        c.AccountId = a.Id;
        
        Contact c2 = new Contact();
        c2.FirstName = 'Tom';
        c2.LastName = 'Cruise';
        c2.AccountId = a.Id;
        
        List<Id> acctIds = new List<Id>();
        acctIds.add(a.Id);
        
        // Captures async calls.
        Test.startTest();
        AccountProcessor.countContacts(acctIds); // The unit tests must cover all lines of code included in the AccountProcessor class, resulting in 100% code coverage.
                                                 // I'm assuming this means that we have to hit all the methods and every path in the methods.
        Test.stopTest();
        // Ends the capture.
    }
}