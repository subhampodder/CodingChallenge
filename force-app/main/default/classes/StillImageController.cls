public class StillImageController {

    public Blob responseBody {get; set;}
    public String endpoint{get;set;}
    
    Public pageReference getMapData(){
    
    //creating new http req
    Http httpProtocol = new Http();
    HttpRequest request = new HttpRequest();
    
    //set endpoint and method
    String license_key = 'or2n5b7ofeh8bsovhyi6i7vcwj65zftn';
    endpoint = 'https://apis.mapmyindia.com/advancedmaps/v1/or2n5b7ofeh8bsovhyi6i7vcwj65zftn/still_image?center=28.595939499830784,77.22556114196777&zoom=12&size=400x300&ssf=1&markers=28.595939,77.225561|28.596000,77.225600%3E>';
    request.setEndpoint(endpoint);
    request.setMethod('GET');
    
    //get response
    HttpResponse response = httpProtocol.send(request);
    responseBody = response.getBodyAsBlob();
    return null;
    
    }    
}