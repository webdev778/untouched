import React, { Component } from 'react';
import { Link } from 'react-router';
import cx from './InvitesForm.scss';

export default class InvitesForm extends Component {

  componentWillMount() {
    if (this.props.user) {
      this.props.actions.invites({
        company_id: this.props.user.company_id
      });
    }
  }

  removeInvite = (token) => (e) => {
    this.props.actions.removeInvite(token);
  }

  handleSubmitClick = (e) => {
    e.preventDefault();

    this.props.actions.invite({
      email: this.email.value,
      name: this.name.value,
      company_id: this.props.user.company_id,
    });
  }

  render() {
    const { user, invites } = this.props;

    return (
      <div className={cx('invites-form')}>
        <form onSubmit={this.handleSubmitClick}>
          <h1>{user.company.name} team</h1>

          <ul>
            {invites.map((user, key) => (
              <li key={key}>{user.name} {user.email} <a onClick={this.removeInvite(user.invitation_token)}>X</a></li>
            ))}
          </ul>

          <div>
            <input type='name'
              id='name'
              name='name'
              placeholder='Name'
              ref={(c) => this.name = c} />
            <input type='email'
              id='email'
              name='email'
              placeholder='Email'
              ref={(c) => this.email = c} />
            <button type="submit" className="btn btn--primary">Add person</button>
          </div>

          <div className="action-controls">
            <Link to="/pub" className="btn btn--light">Continue on site</Link>
          </div>
        </form>
      </div>
    );
  }

}
