import { LightningElement,wire,track } from 'lwc';
import getPincodeDetails from  '@salesforce/apex/REST_PostalApiController.getDetailsByPincode';
export default class Lwr_PostalApiDetails extends LightningElement {


    pincode = '';
  isValid = false;
  @track openSection = false;
  @track result;
  handleInputChange(event) {
    this.pincode = event.target.value;

    // Validation: exactly 6 digits, all numeric
    const regex = /^\d{6}$/;
    this.isValid = regex.test(this.pincode);
  }

  handleSubmit() {
    // Your logic here, e.g. calling Apex
    console.log('Submitted Pincode:', this.pincode);
    getPincodeDetails({pinCode: this.pincode})
    .then(result=>{
      console.log('@@result',result);
      if(result){
        this.openSection = true;
        this.result = result;
      }
      
    })
    .catch(error=>{
      console.log('@@error',error);
    })
  }
}