public class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT Id FROM Lead WHERE LeadSource = null OR LeadSource = '' LIMIT 200];
        for (Lead lead : leads){
            lead.LeadSource = 'Dreamforce';
        }
        update leads;
    }
}