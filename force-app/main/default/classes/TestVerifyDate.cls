@isTest
private class TestVerifyDate {
    @isTest
    static void TestVerifyDate() {
        // Year, Month, Day
        System.assertEquals(Date.newInstance(2024, 1, 2), VerifyDate.CheckDates(Date.newInstance(2024, 1, 1), Date.newInstance(2024, 1, 2)));
        System.assertEquals(Date.newInstance(2024, 1, 31), VerifyDate.CheckDates(Date.newInstance(2024, 1, 1), Date.newInstance(2024, 2, 29)));
    }
}