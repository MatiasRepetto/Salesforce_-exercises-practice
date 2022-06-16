public class AnimalLocator {
    public static string getAnimalNameById(integer id) {
        Http http = new Http();
        string namee;
		HttpRequest request = new HttpRequest();
		request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' +id);
		request.setMethod('GET');
		HttpResponse response = http.send(request);
		// If the request is successful, parse the JSON response.
		if(response.getStatusCode() == 200) {
    		Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Ponemos los objetos de results en un map para poder filtrar por palabra clave
            Map<String, Object> animal = (Map<String, Object>) results.get('animal');
            namee = string.valueOf(animal.get('name')); 
		}
        return namee;
    }
}