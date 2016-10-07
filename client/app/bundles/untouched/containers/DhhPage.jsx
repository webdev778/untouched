import React, { Component } from 'react';
import RouteGenerator from '../route_generator';

import DevelopmentActions from '../actions/development_actions';

export default class DhhPage extends Component {

  componentDidMount() {
    DevelopmentActions.addFilterData({ dhh: 1, private: true });
  }

  render() {
    return (
      <div>
        { this.props.children }
      </div>
    );
  }
}

