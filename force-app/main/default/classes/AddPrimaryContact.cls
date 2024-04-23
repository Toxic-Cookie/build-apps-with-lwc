public class AddPrimaryContact implements Queueable {
    Contact pcontact;
    String pstate;

    public AddPrimaryContact(Contact contact, String state) {
        pcontact = contact;
        pstate = state;
    }

    public void execute(QueueableContext context) {
        List<Account> accounts = [SELECT Id FROM Account WHERE BillingState = :pstate LIMIT 200];
        List<Contact> dupedContacts = new List<Contact>();
        for (Account account : accounts) {
            dupedContacts.add(pcontact.clone(false, true, false, false));
        }
        insert dupedContacts;
    }
}