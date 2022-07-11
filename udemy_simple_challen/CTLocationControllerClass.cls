public with sharing class CTLocationControllerClass {
    
    public static list<Location__c> getRecentStatusChanges(){
        list<Location__c> auxList = [SELECT Address__c, CreatedById, LastModifiedById, Name, 
                                            OwnerId, Pincode__c, Red_Score__c, Status__c, Status_Update_Date__c 
                                    FROM Location__c ORDER BY Status_Update_Date__c DESC LIMIT 100];
        return auxList;
    }

    public static list<Location__c> searchLocations(String searchTerm){
        list<Location__c> auxList = [SELECT Address__c, CreatedById, LastModifiedById, Name, 
                                            OwnerId, Pincode__c, Red_Score__c, Status__c, Status_Update_Date__c 
                                    FROM Location__c WHERE Name = :searchTerm OR Pincode__c = :searchTerm OR Address__c = :searchTerm 
                                    ORDER BY Status_Update_Date__c DESC];
        return auxList;
    }

    public static Location__c getLocationById(string locationId){
        list<Location__c> auxList = [SELECT Address__c, CreatedById, LastModifiedById, Name, 
                                     OwnerId, Pincode__c, Red_Score__c, Status__c, Status_Update_Date__c 
                            FROM Location__c WHERE Id = :locationId];
        if(auxList != null && auxList.size() > 0){
            return auxList[0];
        }
        return null;
    }

    public static Map<String, Integer> getStatusCount(){
        Map<String, Integer> auxMap = new Map<String, Integer>();
        for(AggregateResult rec : [SELECT Status__c, COUNT(Id) FROM Location__c GROUP BY Status__c]){
            auxMap.put(String.valueOf(rec.get('Status__c')), Integer.valueOf(rec.get('expr0')));
        }
        return auxMap;
    }
}
