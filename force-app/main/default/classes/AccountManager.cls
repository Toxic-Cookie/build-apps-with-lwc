@RestResource(urlMapping='/Accounts/*/contacts/')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        
        // Get the full request path
        String requestPath = request.requestURI;

        // Split the path into segments
        List<String> pathSegments = requestPath.split('/');
        
        // The value for the '*' is the fourth segment (index 2)
        String accountId = pathSegments[pathSegments.indexOf('Accounts') + 1];

        Account result = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account WHERE Id = :accountId];

        return result;
    }
}