import axios from 'axios';
import ReactOnRails from 'react-on-rails';
axios.defaults.headers = ReactOnRails.authenticityHeaders();

export default class TryItFreeSource {

  static create(params) {
    return axios.post('/api/try_it_free', { email: params });
  }
}
