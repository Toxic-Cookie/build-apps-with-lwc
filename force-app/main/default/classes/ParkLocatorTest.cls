@isTest
private class ParkLocatorTest {
    @isTest
    static void testCallout() {
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String[] result = ParkLocator.country('Japan');
        // Verify that a fake result is returned
        Assert.isTrue(result.size() > 0);
    }
}