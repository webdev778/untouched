import alt from '../alt';
import EnquirySource from '../sources/enquiry_source';

class EnquiryActions {
  submitEnquiry(params) {
    return EnquirySource.create(params).
      then(response => this.updateEnquiry(response.data)).
      catch(error => this.submitEnquiryFailed(error));
  }

  updateEnquiry(enquiry) {
    return enquiry;
  }

  submitEnquiryFailed(error) {
    return error;
  }
}

export default alt.createActions(EnquiryActions);

