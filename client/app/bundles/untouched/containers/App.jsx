import React, { Component } from 'react';
import RouteGenerator from '../route_generator';

import UserActions from '../actions/user_actions';
import UserStore from '../stores/user_store';

export default class App extends Component {

  componentWillMount() {
    UserActions.session();
  }

  render() {
    return (
      <div>
        { this.props.children }
      </div>
    );
  }
}

