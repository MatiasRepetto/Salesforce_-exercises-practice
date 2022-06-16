trigger AccountAddressTrigger on Account (before insert, before update) {
    if(trigger.isInsert || trigger.isUpdate){
        for(Account a : Trigger.New){
            if(a.Match_Billing_Address__c == True){
				a.ShippingCity = a.BillingCity; 
				a.ShippingCountry = a.BillingCountry;
				a.ShippingPostalCode = a.BillingPostalCode;
				a.ShippingState = a.BillingState;
				a.ShippingStreet = a.BillingStreet;
            }
        }
    }
}