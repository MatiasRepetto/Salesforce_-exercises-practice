public with sharing class CTPersonController {

    public static String getToken(String telephone){
        blob tokenizedStr = blob.valueOf(telephone);
        blob hash = Crypto.generateDigest('MD5', tokenizedStr);
        return EncodingUtil.base64Encode(hash);
    }

    public static list<Person__c> getRecentHealChenges(){
        list<Person__c> auxList = [SELECT CreatedById, Health_Status__c, LastModifiedById, Mobile__c, Name, OwnerId, Status_Update_Date__c, Token__c FROM Person__c ORDER BY Status_Update_Date__c DESC LIMIT 100];
        return auxList;
    }

    public static list<Person__c> searchPeople(String searchTerm){
        list<Person__c> auxList = [SELECT CreatedById, Health_Status__c, LastModifiedById, Mobile__c, Name, OwnerId, Status_Update_Date__c, Token__c 
                                    FROM Person__c 
                                    WHERE Name = :searchTerm OR Token__c = :searchTerm OR Mobile__c = :searchTerm 
                                    ORDER BY Status_Update_Date__c DESC];
        return auxList;
    }

    public static Person__c getPersonById(string personId){
        list<Person__c> auxList = [SELECT CreatedById, Health_Status__c, LastModifiedById, Mobile__c, Name, OwnerId, Status_Update_Date__c, Token__c FROM Person__c WHERE Id = :personId];
        if(auxList != null && auxList.size() > 0){
            return auxList[0];
        }
        return null;
    }

    public static Map<string, integer> getHealtStatusCount(){
        Map<String, Integer> auxMap = new Map<String, Integer>();
        for(AggregateResult res : [SELECT Health_Status__c, COUNT(Id) FROM Person__c GROUP BY Health_Status__c]){
            auxMap.put(string.valueOf(res.get('Health_Status__c')), integer.valueOf(res.get('expr0')));
        }
        return auxMap;
    }
}
