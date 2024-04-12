public with sharing class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> accounts) {
        for (Integer i = 0; i < accounts.size(); i++){
            accounts[i].ShippingState = accounts[i].BillingState;
        }
    }
}