public with sharing class AccountHandler {
    public static void insertAccount(Integer newAccounts) {
        List<Account> addAccounts = new List<Account>();
        Integer N = 0;
        while (N < newAccounts) {
            Account acc = new Account();
            acc.Name = 'Acme Inc ' + N.toString();
            acc.AccountNumber = 'A000' + N.toString();
            addAccounts.add(acc);
            N++;
        }
        insert addAccounts;
    }
    public static void CreateNewOpportunity(List<Account> accts) {
        List<Opportunity> opps = new List<Opportunity>();
        for (Account a : accts) {
            Opportunity opp = new Opportunity();
            opp.Name = a.Name + ' Opportunity';
            opp.AccountId = a.Id;
            opp.StageName = 'Prospecting';
            opp.CloseDate = System.Today().addMonths(1);
            opps.add(opp);
        }
        if (opps.size() > 0) {
            insert opps;
        }
    }
}
