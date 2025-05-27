public class REST_PostalApiWrapper {

	@AuraEnabled public String Message;
    @AuraEnabled public String Status;
    @AuraEnabled public List<PostOffice> PostOffice;

	class PostOffice {
		 @AuraEnabled public String Name;
        @AuraEnabled public String Description;
        @AuraEnabled public String BranchType;
        @AuraEnabled public String DeliveryStatus;
        @AuraEnabled public String Taluk;
        @AuraEnabled public String Circle;
        @AuraEnabled public String District;
        @AuraEnabled public String Division;
        @AuraEnabled public String Region;
        @AuraEnabled public String State;
        @AuraEnabled public String Country;
	}


}