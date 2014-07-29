public with sharing class util_StringNormalizer {

	/**
	remove all characters except alpha characters & put to lower case
	**/
	public string stringNorm(string stringToNorm){
        string cleanName;
        
        cleanName = stringToNorm.toLowerCase();
        cleanName = cleanName.replaceAll('[^A-Za-z ]','');
        
        cleanName = cleanName.trim();
        
        return cleanName;
    }

    /**
	remove all characters except alphanumeric characters & put to lower case
	**/
    public string stringNormNumeric(string stringToNorm){
        string cleanName;
        
        cleanName = stringToNorm.toLowerCase();
        cleanName = cleanName.replaceAll('[^A-Za-z0-9 ]','');
        
        cleanName = cleanName.trim();
        
        return cleanName;
    }

    /**
		converts a given string to Title Case where the first letter of every word is capitalised and the rest are small
	**/
	public String toTitleCase(string phrase){
	  string titlePhrase = '';

	  //set of strings to skip if they are the first word in a string.
	  set<string> forceLower = new set<string>{'of', 'the', 'for', 'and', 'a', 'to', 'at' ,'an', 'but', 'if', 'or', 'nor'};

	  if(phrase != null && phrase.length() > 0){
	    string[] splitPhrase = phrase.trim().split(' ');
				
	    for(integer i = 0; i < splitPhrase.size(); i++){
	      if((!forceLower.contains(splitPhrase[i].toLowerCase()) || i == 0 || i == (splitPhrase.size()-1)) && splitPhrase[i].length() > 0 ){
	        titlePhrase += (splitPhrase[i].substring(0,1).toUpperCase())+(splitPhrase[i].substring(1).toLowerCase())+' ';
	      }else{
	        titlePhrase += splitPhrase[i].toLowerCase()+' ';
	      }
	    }
	  }
	  return titlePhrase.trim();
	}

}