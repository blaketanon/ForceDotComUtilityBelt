global class Admin_sObjectFieldUpdaterBatch implements Database.Batchable<sobject>, Database.Stateful {

    /**
    Run This Batch

    string query = ;
    string nextBatch = ;
    string sObj = ;
    string field = ;
    object changeTo = ;
    integer batSize = ;
    
    ID idBatch = Database.executeBatch(new Admin_sObjectFieldUpdaterBatch(query,nextBatch,sObj,field,changeTo), batSize);
    **/

    global string query;
    global string nextBatch;

    global string sObjName;
    global string sObjFieldName;
    global sObjectType sObjType;
    global sObjectField sObjField;

    global object changeTo;

    private Map<String, Schema.SObjectType> smap = Schema.getGlobalDescribe();

    global integer NumBatches;
    
    global Admin_sObjectFieldUpdaterBatch(String qry, string nextBat, string obj, string field, object changeObj) {

        Query = qry;
        
        nextBatch = nextBat;

        sObjName = obj;
        
        changeTo = changeObj;

        SObjectType sObjType;

        if(smap.get(obj) != null){

            sObjType = smap.get(obj);

            Map<String,Schema.SObjectField> fieldMap = sObjType.getDescribe().fields.getMap(); 

            if(fieldMap.get(field) != null){
                
            	sObjFieldName = field;

            	sObjField = fieldMap.get(field);

            }

        }

    }
    
    global Database.QueryLocator start(Database.BatchableContext bcMain) {
        return Database.getQueryLocator(Query);
    }
    
    global void execute(Database.BatchableContext bcMain, List<sObject> scope) {
        List<sObject> scopeToUpdate = scope;

        for(sObject s : scopeToUpdate){
        		s.put(sObjField, changeTo);
        }

        if(scopeToUpdate.size() > 0) { 
            update scopeToUpdate; 
        }
    }
    
    global void finish(Database.BatchableContext bcMain) {

    } 
	
}