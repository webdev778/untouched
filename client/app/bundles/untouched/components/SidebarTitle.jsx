import React, { Component } from 'react';

export default class SidebarTitle extends Component {
  render() {
    return <h4 className='sidebar__title'>{this.props.value}</h4>;
  }
}

