@isTest
private class TestRestrictContactByName {
    @isTest
    static void TestRestrictContactByName() {
        Contact invalidContact = new Contact();
        invalidContact.FirstName = 'John';
        invalidContact.LastName = 'INVALIDNAME';
        Exception invalidContactException;
        Database.SaveResult invalidResult;

        Contact validContact = new Contact();
        validContact.FirstName = 'John';
        validContact.LastName = 'Johnson';

        Test.startTest();
            try {
                invalidResult = Database.insert(invalidContact);
            }
            catch(Exception e) {
                invalidContactException = e;
            }
            
            Database.SaveResult validResult = Database.insert(validContact);
        Test.stopTest();

        System.assert(invalidResult == null, 'Contact was allowed to be inserted with an invalid last name of "INVALIDNAME".');
        System.assert(validResult.success, 'Contact was not allowed to be inserted with a valid last name.');
    }
}