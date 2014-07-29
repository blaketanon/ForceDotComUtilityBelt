global class Admin_sObjectDeleterBatch implements Database.Batchable<sobject>, Database.Stateful{

    /**
    Run This Batch

    string query = '';
    
    ID idBatch = Database.executeBatch(new Admin_sObjectDeleterBatch(query), 200);
     **/

    global string query;
    
    
    // Class Constructor - set query string
    global Admin_sObjectDeleterBatch(String q) {
        query = q;
    }
    
    // "Start" runs when the class in instanciated
    global Database.QueryLocator start(Database.BatchableContext bcMain) {
        return Database.getQueryLocator(query);
    }
    
    // "Execute" is what is being run as a separate process per batch
    global void execute(Database.BatchableContext bcMain, List<sObject> scope) {

        List<sObject> scopeToUpdate = scope;

        if(scopeToUpdate.size() > 0) { 
            delete scopeToUpdate; 
        }

    }
    
    // Finish the Batch Job
    global void finish(Database.BatchableContext bcMain) {
        
        
    } 
    
}