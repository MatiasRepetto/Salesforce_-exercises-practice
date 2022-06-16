public with sharing class WarehouseCalloutService implements Queueable{
    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    @future(callout=true)
    public static void metodocallout(){
        Http http = new Http();
    	HttpRequest request = new HttpRequest();
    	request.setEndpoint(WAREHOUSE_URL);
    	request.setMethod('GET');
    	HttpResponse response = http.send(request);
        List<Product2> auxEquip = new List<Product2>();
    	if(response.getStatusCode() == 200) {
        	List<Object> results = (List<Object>) JSON.deserializeUntyped(response.getBody());
        	for(Object obj: results) {
        		Map<String,Object> tempMap = (Map<String,Object>)obj;
           		Product2 auxProd = new Product2();
            	auxProd.Replacement_Part__c = true;
            	auxProd.Current_Inventory__c = (Decimal)tempMap.get('quantity');
            	auxProd.Lifespan_Months__c = (Decimal)tempMap.get('lifespan');
            	auxProd.Maintenance_Cycle__c = (Decimal)tempMap.get('maintenanceperiod');
            	auxProd.Warehouse_SKU__c = (string)tempMap.get('sku');
                auxProd.Name = (string)tempMap.get('name');
                auxProd.Cost__c = (Decimal)tempMap.get('cost');
            	auxEquip.add(auxProd);
        	}
     	}
     	if(auxEquip.size() > 0){
        	upsert auxEquip;
        }
    }
    public static void execute (QueueableContext context){
        metodocallout();
    }
}