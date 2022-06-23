({
	packItem : function(component, event, helper) {
		let btnClicked = event.getSource();         // the button
        component.set("v.item.Packed__c", true);
        component.set("v.disabled", true);
	}
})