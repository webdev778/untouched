import React, { Component } from 'react';
import { Link, Element } from 'react-scroll';

import UserActions from '../../actions/user_actions';
import UserStore from '../../stores/user_store';

export default class SignUpForm extends Component {

  handleRegistrationClick = (e) => {
    e.preventDefault();

    UserActions.register({
      email: this.email.value,
      uid: this.email.value,
      password: this.password.value,
      password_confirmation: this.password_confirmation.value,
      name: this.name.value,
      provider: "email"
    });
  }

  render() {
    return (
      <form onSubmit={this.handleRegistrationClick}>
        <div className="form__group">
          <input type='text'
            name='name'
            placeholder='name'
            ref={(c) => this.name = c} />
        </div>

        <div className="form__group">
          <input type='email'
            name='email'
            placeholder='email'
            ref={(c) => this.email = c} />
        </div>

        <div className="form__group">
          <input type='password'
            name='password'
            placeholder='password'
            ref={(c) => this.password = c} />
        </div>

        <div className="form__group">
          <input type='password'
            name='password_confirmation'
            placeholder='re-type password'
            ref={(c) => this.password_confirmation = c} />
        </div>

        <button type="submit">Sign up</button>
      </form>
    );
  }

}
