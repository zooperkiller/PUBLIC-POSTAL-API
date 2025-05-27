public with sharing class REST_PostalApiController {
    
    @AuraEnabled(cacheable=true)
public static REST_PostalApiWrapper getDetailsByPincode(String pinCode) {
    System.debug('📍[DEBUG] Entering getDetailsByPincode with pinCode: ' + pinCode);

    try {
        HttpRequest request = new HttpRequest();
        String endpoint = 'http://www.postalpincode.in/api/pincode/' + pinCode;
        request.setEndpoint(endpoint);
        request.setHeader('Content-Type', 'application/JSON');
        request.setHeader('Accept', 'application/JSON');
        request.setMethod('GET');

        System.debug('📍[DEBUG] Sending request to: ' + endpoint);

        Http http = new Http();
        HttpResponse res = http.send(request);

        String responseBody = res.getBody();
        Integer responseCode = res.getStatusCode();

        System.debug('📬[DEBUG] Status Code: ' + responseCode);
        System.debug('📬[DEBUG] Response Body: ' + responseBody);

        if (responseCode == 200) {
            REST_PostalApiWrapper wrapper = (REST_PostalApiWrapper) JSON.deserialize(responseBody, REST_PostalApiWrapper.class);
            System.debug('📦[DEBUG] Parsed Wrapper: ' + wrapper);
            return wrapper;
        } else {
            System.debug('⚠️ [WARN] Non-200 response code: ' + responseCode);
            return new REST_PostalApiWrapper(); // return empty wrapper
        }
    } catch (Exception e) {
        System.debug('❌[ERROR] ' + e.getMessage() + ' at line ' + e.getLineNumber());
        return new REST_PostalApiWrapper(); // also return empty wrapper in error
    }
}
}