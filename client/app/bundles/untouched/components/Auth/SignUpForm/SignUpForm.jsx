import React, { Component } from 'react';
import cx from './SignUpForm.scss';

export default class SignUpForm extends Component {

  state = {
    company_type: 'agency',
  }

  handleChangeCompanyType = (e) => {
    this.setState({ company_type: e.target.value });
  }

  handleSubmitClick = (e) => {
    e.preventDefault();

    this.props.actions.register({
      provider: "email",
      uid: this.email.value,
      email: this.email.value,
      name: this.name.value,
      password: this.password.value,
      company_attributes: {
        name: this.company_name.value,
        kind: this.state.company_type
      }
    });
  }

  render() {
    const { user } = this.props;

    return (
      <div className={cx('sign-up-form')}>
        <form onSubmit={this.handleSubmitClick}>
          <h1>Company Sign Up</h1>

          <div className="form__group company-type">
            <div>I'm an:</div>
            <div>
              <input type="radio"
                value="agency"
                id="agency"
                name="company_type"
                checked={this.state.company_type === 'agency'}
                onChange={this.handleChangeCompanyType} />
              <label htmlFor="agency">Agency</label>

              <input type="radio"
                value="developer"
                id="developer"
                name="company_type"
                checked={this.state.company_type === 'developer'}
                onChange={this.handleChangeCompanyType} />
              <label htmlFor="developer">Developer</label>
            </div>
          </div>

          <div className="form__group">
            <label htmlFor="company_name">Company name:</label>
            <input type='text'
              id='company_name'
              name='company_name'
              placeholder='Company name'
              ref={(c) => this.company_name = c} />
          </div>

          <div className="form__group">
            <label htmlFor="name">Your name:</label>
            <input type='name'
              id='name'
              name='name'
              placeholder='Name'
              ref={(c) => this.name = c} />
          </div>

          <div className="form__group">
            <label htmlFor="email">Your email:</label>
            <input type='email'
              id='email'
              name='email'
              placeholder='Email'
              ref={(c) => this.email = c} />
          </div>

          <div className="form__group">
            <label htmlFor="password">Password:</label>
            <input type='password'
              id='password'
              name='password'
              placeholder='Password'
              ref={(c) => this.password = c} />
          </div>

          <div className="action-controls">
            <button type="submit" className="btn btn--primary btn-lg">Create account</button>
          </div>
        </form>
      </div>
    );
  }

}
