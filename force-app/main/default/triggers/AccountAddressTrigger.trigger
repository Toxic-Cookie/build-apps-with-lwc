trigger AccountAddressTrigger on Account (before insert, before update) {
    for (Account acc : Trigger.new) {
        // Check if the Match Billing Address option is selected
        if (acc.Match_Billing_Address__c == true) {
            // Set the Shipping Postal Code to match the Billing Postal Code
            acc.ShippingPostalCode = acc.BillingPostalCode;
        }
    }
}
