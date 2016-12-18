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
    this.invites = [];
  }

  onInitData(props) {
    this.user = props.user;
    this.users = props.users;
    this.invites = props.invites;
  }

  session() {
    return axios.get('/api/auth/is_signed_in.json')
      .then((response) => {
        this.user = response.data;
        this.emitChange();
      })
      .catch((response) => {
        console.log('error', response);
      });
  }

  register(data) {
    return axios.post('/users.json', { user: data })
      .then((response) => {
        this.user = response.data;
        this.emitChange();
      })
      .catch((response) => {
        console.log('error', response);
      });
  }

  logout() {
    return axios.delete('/users/sign_out.json')
      .then((response) => {
        this.user = null;
        this.emitChange();
      })
      .catch((response) => {
        console.log('error', response);
      });
  }


  invite(data) {
    return axios.post('/users/invitation.json', { user: data })
      .then((response) => {
        var user = _.find(this.invites, (user) => (
          user.email == response.data.email
        ));

        if (!user) {
          this.invites.push(response.data);
        }
        this.emitChange();
      })
      .catch((response) => {
        console.log('error', response);
      });
  }

  removeInvite(token) {
    return axios.get('/api/invitations/remove.json', { params: { invitation_token: token }})
      .then((response) => {
        this.invites = this.invites.filter(user => (user.invitation_token != token));
        this.emitChange();
      })
      .catch((response) => {
        console.log('error', response);
      });
  }

  invites(data) {
    return axios.get('/api/invitations.json', { params: data })
      .then((response) => {
        this.invites = response.data;
        this.emitChange();
      })
      .catch((response) => {
        console.log('error', response);
      });
  }
}

export default alt.createStore(UserStore);

