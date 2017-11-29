import React, { Component } from 'react';
import cx from './SignUpShow.scss';

import InvitesForm from './InvitesForm';
import SignUpForm from './SignUpForm';

export default class SignUpShow extends Component {

  render() {
    const { user } = this.props;

    return (
      <div className={cx('sign-up')}>
        {user ?
        <InvitesForm
          user={this.props.user}
          invites={this.props.invites}
          actions={this.props.actions}
        />
        :
        <SignUpForm
          user={this.props.user}
          invites={this.props.invites}
          actions={this.props.actions}
        />
        }
      </div>
    );
  }

}
