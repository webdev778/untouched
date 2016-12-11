import alt from '../alt';
import axios from 'axios';
import ReactOnRails from 'react-on-rails';
axios.defaults.headers = ReactOnRails.authenticityHeaders();

import UserActions from '../actions/user_actions';

class UserStore {

  static displayName = 'UserStore';

  constructor() {
    this.bindActions(UserActions);
    this.user = {};
    this.users = [];
  }

  onInitData(props) {
    this.user = props.user
    this.users = props.users;
  }

  register(data) {
    return axios.post('/users.json', { user: data })
      .then((response) => {
        console.log(response);
      })
      .catch((response) => {
        console.log('error', response);
      });
  }

}

export default alt.createStore(UserStore);

