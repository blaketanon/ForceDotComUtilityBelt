global class util_sObjectUpdaterBatch implements Database.Batchable<sobject>, Database.Stateful {

    /**
    Run This Batch

    string query = '';
    
    ID idBatch = Database.executeBatch(new util_sObjectUpdaterBatch(query), 200);
    **/

    global string query;
    
    global util_sObjectUpdaterBatch(string q) {
        
        query = q;
        
    }
    
    global Database.QueryLocator start(Database.BatchableContext bcMain) {
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bcMain, List<sObject> scope) {

        if(scope.size() > 0) { 
            update scope; 
        }

    }
    
    global void finish(Database.BatchableContext bcMain) {

    } 
    
}
