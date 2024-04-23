@isTest
public class AddPrimaryContactTest {
    @testSetup
    static void setup() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 100; i++) {
            Account account = new Account();
            account.Name = 'sussy baka ' + i;
            account.BillingState = i < 50 ? 'NY' : 'CA';
            accounts.add(account);
        }
        insert accounts;
    }
    static testmethod void testQueueable() {
        // Query for test data to pass to queueable class
        List<Account> accounts = [SELECT BillingState FROM Account WHERE Name LIKE 'sussy baka%'];
        Contact c = new Contact();
        c.FirstName = 'sussiest';
        c.LastName = 'baka';
        // Create our Queueable instance
        AddPrimaryContact updater = new AddPrimaryContact(c, 'CA');
        // startTest/stopTest block to force async processes to run
        Test.startTest();
        System.enqueueJob(updater);
        Test.stopTest();
        // Validate the job ran. Check if record have correct parentId now
        List<Contact> contacts = [SELECT Id FROM Contact WHERE Name = 'sussiest baka' LIMIT 50];
        System.assertEquals(50, contacts.size(), 'Could not find 50 contacts.');
    }
}