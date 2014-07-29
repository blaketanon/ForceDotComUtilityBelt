public with sharing class util_DoubleToStringConverter {

    /**
        Converts a double into it a string representation
        Blake J. Tanon
        Blake.Tanon@gmail.com
        https://github.com/blaketanon
    **/

    private static list<String> units = new list<string> {'Zero', 'One', 'Two', 'Three',
        'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten', 'Eleven',
        'Twelve', 'Thirteen', 'Fourteen', 'Fifteen', 'Sixteen',
        'Seventeen', 'Eighteen', 'Nineteen' };

    private static list<String> tens = new list<string> { '', '', 'Twenty', 'Thirty', 'Forty',
        'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety' };
 

    public String ConvertAmount(double amount){
        try{
            integer amount_int = (integer)amount;
            integer amount_dec = (integer)Math.Round((amount - (double)(amount_int)) * 100);
            return  convert(amount_int) + ' Dollars and ' + integer.valueof(amount_dec) + '/100' ;
        }
        catch (Exception e){
            system.debug('# # # # convertAmount Exception: '+e);
        }
        return null;
    }
 
    public String convert(integer i){
        //int max is 2,147,483,647
        if (i < 20)//20
            return units[i];
        if (i < 100)//100
            return tens[i / 10] + ( (math.mod(i , 10) > 0) ? ' ' + convert(math.mod(i , 10)) : '');
        if (i < 1000)//1k
            return units[i / 100] + ' Hundred' + ( (math.mod(i , 100) > 0) ? ' ' + convert(math.mod(i , 100)) : '');
            
        if (i < 100000)//100k
            return convert(i / 1000) + ' Thousand' + ( (math.mod(i , 1000) > 0) ? ' ' + convert(math.mod(i , 1000)) : '');
        if (i < 1000000)//1MM
            return convert(i / 100000) + ' Hundred' + ( (math.mod(i , 100000) > 0) ? ' ' + convert(math.mod(i , 100000)) : '');
            
        if (i < 100000000)//100MM
            return convert(i / 1000000) + ' Million' + ( (math.mod(i , 1000000) > 0) ? ' ' + convert(math.mod(i , 1000000)) : '');
        if (i < 1000000000)//1BN
            return convert(i / 100000000) + ' Hundred' + ( (math.mod(i , 100000000) > 0) ? ' ' + convert(math.mod(i , 100000000)) : '');
        
        if (i <= 2147483647)//2,147,483,647 is max int size
            return convert(i / 1000000000) + ' Billion' + ( (math.mod(i , 1000000000) > 0) ? ' ' + convert(math.mod(i , 1000000000)) : '');

        return 'ERROR: Number To Large';
    }
 
   
}