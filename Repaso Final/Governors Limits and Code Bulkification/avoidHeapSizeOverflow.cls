//Para evitar el heap size en consultas muy pesadas no usar:

	List<Account> aux = [SELECT ........ FROM Account];

//Por el contrario usar:
	
	for(Account a : [SELECT ........ FORM Account]){
	
	} 
	
	// Esto hace que se traigan de a 200 records para cada estado del for 
	// por ende nunca hitea el heap size.