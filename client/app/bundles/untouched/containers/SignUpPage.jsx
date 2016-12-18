import React, { Component } from 'react';
import { Link, Element } from 'react-scroll';

import UserActions from '../actions/user_actions';
import UserStore from '../stores/user_store';

import Header from '../components/Header';
import Footer from '../components/Footer';
import SignUpShow from '../components/Auth/SignUpShow';

export default class SignUpPage extends Component {

  state = {
    user: {},
    invites: []
  }

  componentWillMount() {
    UserStore.listen(this.onChange);
  }

  componentWillUnmount() {
    UserStore.unlisten(this.onChange);
  }

  onChange = (state) => {
    this.setState(state);
  }

  render() {
    return (
      <div className='sign-up sign-up-page'>

        <Header />

        <main className="main">
          {(!_.isEmpty(this.state.user) || this.state.user == null)  &&
          <SignUpShow
            actions={UserActions}
            user={this.state.user}
            invites={this.state.invites}
          />
          }
        </main>

        <Footer />

      </div>
    );
  }

}
