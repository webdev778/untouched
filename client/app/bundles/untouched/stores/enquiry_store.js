import alt from '../alt';

import EnquiryActions from '../actions/enquiry_actions';

class EnquiryStore {

  constructor() {
    this.bindListeners({
      handleSubmitEnquiry: EnquiryActions.SUBMIT_ENQUIRY,
      handleUpdateEnquiry: EnquiryActions.UPDATE_ENQUIRY,
      handleSubmitEnquiryFailed: EnquiryActions.SUBMIT_ENQUIRY_FAILED
    });
  }

  handleSubmitEnquiry(...args) {
    return this;
  }

  handleUpdateEnquiry(enquiry) {
    this.enquiry = enquiry;
  }

  handleSubmitEnquiryFailed(error) {
    this.error = error;
  }
}

export default alt.createStore(EnquiryStore);

