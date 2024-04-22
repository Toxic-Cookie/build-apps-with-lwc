@isTest
global class AnimalLocatorMock implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        System.debug('BODY: ' + request.getBody());
        // WORK YOU PIECE OF SHIT
        if (request.getEndpoint().contains('1')){
            response.setBody('{\"animal\":{\"id\":1,\"name\":\"chicken\",\"eats\":\"chicken food\",\"says\":\"cluck cluck\"}}');
        }
        else {
            response.setBody('{\"animal\":{\"id\":0,\"name\":\"\",\"eats\":\"\",\"says\":\"\"}}');
        }
        response.setStatusCode(200);
        return response;
    }
}