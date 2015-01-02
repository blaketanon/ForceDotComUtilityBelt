global class util_sObjectFieldUpdaterBatch_schedule implements Schedulable {

	global string query;
	global string nextBatch;
	global string sObj;
	global string field;
	global object changeTo;
	global integer batSize;

	global util_sObjectFieldUpdaterBatch_schedule(String qry, string nextBat, string obj, string fld, object changeObj, integer size) {
        query = qry;
        nextBatch = nextBat;
        sObj = obj;
        field = fld;
        changeTo = changeObj;
        batSize = size;
    }

    global void execute(SchedulableContext scMain) {
        
        util_sObjectFieldUpdaterBatch clsBatch = new util_sObjectFieldUpdaterBatch(query,nextBatch,sObj,field,changeTo);
        ID idBatch = Database.executeBatch(clsBatch, batSize);
        
    }
    
    /**
     USE THIS TO SET SCHEDULE 

    string query = ;
    string nextBatch = ;
    string sObj = ;
    string field = ;
    object changeTo = ;
    integer batSize = ;
    
    util_sObjectFieldUpdaterBatch_schedule clsCRON = new util_sObjectFieldUpdaterBatch_schedule(query,nextBatch,sObj,field,changeTo,batSize);
    System.Schedule('util_sObjectFieldUpdaterBatch_schedule @ [time?]', '0 0 0 * * ?', clsCRON);
    http://www.salesforce.com/us/developer/docs/apexcode/Content/apex_methods_system_system.htm
    
    **/
}
