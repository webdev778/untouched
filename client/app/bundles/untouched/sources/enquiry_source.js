import axios from 'axios';
import ReactOnRails from 'react-on-rails';
axios.defaults.headers = ReactOnRails.authenticityHeaders();

export default class EnquirySource {

  static create(params) {
    return axios.post('/api/enquiries', { enquiry: params });
  }
}
