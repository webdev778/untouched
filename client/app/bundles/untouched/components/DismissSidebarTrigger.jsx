import React, { Component } from 'react';

import SVGIcon from './SVGIcon';

export default class DismissSidebarTrigger extends Component {

  handleClick() {
    return $('body').removeClass('sidebar-on');
  }

  render() {
    return (
      <button className="btn--flat sidebar-trigger" onClick={this.handleClick}>
        <SVGIcon icon='arrow-left' />
      </button>
    );
  }
}

