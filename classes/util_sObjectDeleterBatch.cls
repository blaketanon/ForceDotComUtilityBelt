global class util_sObjectDeleterBatch implements Database.Batchable<sobject>, Database.Stateful{

    /**
    Run This Batch

    string query = '';
    
    ID idBatch = Database.executeBatch(new util_sObjectDeleterBatch(query), 200);
     **/

    global string query;
    
    
    // Class Constructor - set query string
    global util_sObjectDeleterBatch(String q) {
        query = q;
    }
    
    // "Start" runs when the class in instanciated
    global Database.QueryLocator start(Database.BatchableContext bcMain) {
        return Database.getQueryLocator(query);
    }
    
    // "Execute" is what is being run as a separate process per batch
    global void execute(Database.BatchableContext bcMain, List<sObject> scope) {
        
        if(scope.size() > 0) { 
            delete scope; 
        }

    }
    
    // Finish the Batch Job
    global void finish(Database.BatchableContext bcMain) {
        
        
    } 
    
}
