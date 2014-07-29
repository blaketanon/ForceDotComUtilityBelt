global class Admin_sObjectUpdaterBatch_schedule implements Schedulable {

    global string query;
    global integer batchSize;

    global Admin_sObjectUpdaterBatch_schedule(String q, integer b) {
        query = q;
        batchSize = b;
    }

    global void execute(SchedulableContext scMain) {
        
        Admin_sObjectUpdaterBatch clsBatch = new Admin_sObjectUpdaterBatch(quert);
        ID idBatch = Database.executeBatch(clsBatch, b);
        
    }
    
    /**
     USE THIS TO SET SCHEDULE 
    
    string query = '';
    integer batchSize = ;
    
    Admin_sObjectUpdaterBatch_schedule clsCRON = new Admin_sObjectUpdaterBatch_schedule(query,batchSize);
    System.Schedule('Admin_sObjectUpdaterBatch_schedule @ [time]', '0 30 4 * * ?', clsCRON);
    **/
}