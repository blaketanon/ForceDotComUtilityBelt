global class Admin_sObjectUpdaterBatch implements Database.Batchable<sobject>, Database.Stateful {

    /**
    Run This Batch

    string query = '';
    
    ID idBatch = Database.executeBatch(new Admin_sObjectUpdaterBatch(''), 200);
    **/

    global string query;
    
    global Admin_sObjectUpdaterBatch(string q) {
        
        query = q;
        
    }
    
    global Database.QueryLocator start(Database.BatchableContext bcMain) {
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bcMain, List<sObject> scope) {

        List<sObject> scopeToUpdate = scope;

        if(scopeToUpdate.size() > 0) { 
            update scopeToUpdate; 
        }

    }
    
    global void finish(Database.BatchableContext bcMain) {

    } 
    
}