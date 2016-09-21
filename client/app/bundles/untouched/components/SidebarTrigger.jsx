import React, { Component } from 'react';

import SVGIcon from './SVGIcon';

export default class SidebarTrigger extends Component {
  render() {
    return <button type="button" className="btn--flat sidebar-trigger" onClick={this.handleClick}>
      <SVGIcon icon='filter' />
    </button>;
  }

  handleClick() {
    return $('body').toggleClass('sidebar-on');
  }
}

