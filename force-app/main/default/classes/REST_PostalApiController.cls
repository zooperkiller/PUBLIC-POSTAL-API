public with sharing class REST_PostalApiController {
    
    public static void getDetailsByPincode(string pinCode){
        
        try {
           
            HttpRequest request = new HttpRequest();
            string setEndpoint = 'http://www.postalpincode.in/api/pincode/'+pinCode;
            request.setEndpoint(setEndpoint);
            request.setHeader('Content-Type','application/JSON');
            request.setHeader('Accept','application/JSON');
            request.setMethod('GET');
            Http ht = new Http();
            HttpResponse res =  ht.send(request);
            String  responseBody    =   res.getBody();
            Integer responseCode    =   res.getStatusCode();
            String  responseStatus  =   res.getStatus();
            system.debug('@@@responseBody'+responseBody);
            REST_PostalApiWrapper wrapper = (REST_PostalApiWrapper)System.JSON.deserialize(responseBody , REST_PostalApiWrapper.class);
            
            
            system.debug('@@@wrapper.postPostOffice'+wrapper);
           
        }
        catch (Exception e) {
           
            System.debug(e.getMessage()+'>>>>>>>>>'+e.getLineNumber());
        }
    }
}