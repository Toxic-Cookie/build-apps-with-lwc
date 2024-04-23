@isTest
private class LeadProcessorTest {
    @testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();
        // insert 200 accounts
        for (Integer i = 0; i < 200; i++) {
            Lead lead = new Lead();
            lead.LastName = 'Baka ' + i;
            lead.Status = 'Open - Not Contacted';
            lead.Email = 'sussy' + i + '@baka.com';
            lead.Company = 'Baka Industries ' + i;
            leads.add(lead);
        }
        insert leads;
    }
    @isTest
    static void test() {
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        List<Lead> leads = [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce' LIMIT 200];
        System.assertEquals(200, leads.size());
    }
}