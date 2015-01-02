global class util_sObjectUpdaterBatch_schedule implements Schedulable {

    global string query;
    global integer batchSize;

    global util_sObjectUpdaterBatch_schedule(String q, integer b) {
        query = q;
        batchSize = b;
    }

    global void execute(SchedulableContext scMain) {
        
        util_sObjectUpdaterBatch clsBatch = new util_sObjectUpdaterBatch(quert);
        ID idBatch = Database.executeBatch(clsBatch, b);
        
    }
    
    /**
     USE THIS TO SET SCHEDULE 
    
    string query = '';
    integer batchSize = ;
    
    util_sObjectUpdaterBatch_schedule clsCRON = new util_sObjectUpdaterBatch_schedule(query,batchSize);
    System.Schedule('util_sObjectUpdaterBatch_schedule @ [time]', '0 30 4 * * ?', clsCRON);
    **/
}
