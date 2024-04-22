@IsTest
private class AccountManagerTest {
    @isTest
    static void testGetAccount() {
        Account acme = new Account();
        acme.Name = 'Acme Corp';
        insert acme;

        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri = '/Accounts/' + acme.Id + '/contacts/';
        request.httpMethod = 'GET';
        RestContext.request = request;

        // Call the method to test
        Account acc = AccountManager.getAccount();

        // Verify results
        Assert.isTrue(acc != null);
        Assert.areEqual('Acme Corp', acc.Name);
    }
}