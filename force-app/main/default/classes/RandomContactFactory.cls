public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numberOfContacts, String lastName) {
        List<Contact> contacts = new List<Contact>();
        for (Integer i = 0; i < numberOfContacts; i++){
            Contact c = new Contact();
            c.FirstName = 'Test ' + i;
            c.LastName = lastName;
            contacts.add(c);
        }
        return contacts;
    }
}