@IsTest
private class DailyLeadProcessorTest {
    // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 ? 2042';
    @IsTest
    static void testScheduledJob() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++){
            Lead lead = new Lead();
            lead.FirstName = 'bruh ' + i;
            lead.LastName = 'moment';
            lead.Company = 'bruh corp';
            lead.Status = 'Open - Not Contacted';
            leads.add(lead);
        }
        insert leads;

        Test.startTest();
        System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();

        List<Lead> updatedLeads = [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size(), 'Could not find 200 leads with LeadSource of Dreamforce.');
    }
}