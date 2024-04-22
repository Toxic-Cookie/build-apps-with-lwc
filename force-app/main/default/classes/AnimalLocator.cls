public class AnimalLocator {
    public static String getAnimalNameById(Integer Id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + Id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String result;
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            // Peace was never an option. I have chosen violence.

            Pattern pattern = Pattern.compile('"name":"(.*?)"');
            Matcher matcher = pattern.matcher(response.getBody());

            if (matcher.find()) {
                result = matcher.group(1);
                System.debug('Name: ' + result);
            } else {
                System.debug('No match found');
            }
        }
        return (String.isEmpty(result)) ? null : result;
    }
}