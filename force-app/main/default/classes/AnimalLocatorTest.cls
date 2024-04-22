@isTest
private class AnimalLocatorTest {
    @isTest
    static void testgetAnimalNameById() {
        // Set mock callout class
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());

        // Call method to test
        String none = AnimalLocator.getAnimalNameById(0);
        // Verify null if out of range.
        Assert.areEqual(null,none, 'The animal name should have been null.');

        // Call method to test
        String chicken = AnimalLocator.getAnimalNameById(1);
        // Verify animal name.
        Assert.areEqual('chicken',chicken, 'The animal name should be "chicken".');
    }
}